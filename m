Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 16 Jul 2020 01:37:31 -0000
Message-ID: <159486345166.25377.2548028403157496694@emeril.freedesktop.org>
References: <20200715195324.492926-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200715195324.492926-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_s/huc=5Fcopy/huc-copy/?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1819952306=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1819952306==
Content-Type: multipart/alternative;
 boundary="===============3373898848112527313=="

--===============3373898848112527313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: s/huc_copy/huc-copy/
URL   : https://patchwork.freedesktop.org/series/79530/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5736_full -> IGTPW_4767_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4767_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4767_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4767_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_cursor@pipe-d-viewport-size-256:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-tglb8/igt@kms_plane_cursor@pipe-d-viewport-size-256.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-tglb3/igt@kms_plane_cursor@pipe-d-viewport-size-256.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_huc_copy@huc-copy}:
    - shard-iclb:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb5/igt@gem_huc_copy@huc-copy.html

  
Known issues
------------

  Here are the changes found in IGTPW_4767_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_engines@execute-oneforall:
    - shard-tglb:         [PASS][4] -> [DMESG-WARN][5] ([i915#402]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-tglb3/igt@gem_ctx_engines@execute-oneforall.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-tglb1/igt@gem_ctx_engines@execute-oneforall.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [PASS][6] -> [DMESG-WARN][7] ([i915#118] / [i915#95])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk6/igt@gem_exec_whisper@basic-queues-priority-all.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_flink_race@flink_close:
    - shard-iclb:         [PASS][8] -> [DMESG-WARN][9] ([i915#1982])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-iclb1/igt@gem_flink_race@flink_close.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb2/igt@gem_flink_race@flink_close.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][10] -> [FAIL][11] ([i915#454])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-apl:          [PASS][12] -> [DMESG-WARN][13] ([i915#1635] / [i915#1982])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-apl3/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-apl1/igt@kms_big_fb@linear-8bpp-rotate-0.html
    - shard-kbl:          [PASS][14] -> [DMESG-WARN][15] ([i915#1982])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-kbl4/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-kbl7/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][16] -> [DMESG-FAIL][17] ([i915#118] / [i915#95])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-hsw:          [PASS][18] -> [TIMEOUT][19] ([i915#1958] / [i915#2119])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-hsw7/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-hsw7/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-snb:          [PASS][20] -> [TIMEOUT][21] ([i915#1958] / [i915#2119])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-snb4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-b-cursor-size-change:
    - shard-kbl:          [PASS][22] -> [FAIL][23] ([i915#54])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#54])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
    - shard-apl:          [PASS][26] -> [FAIL][27] ([i915#1635] / [i915#54])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-size-change.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:
    - shard-glk:          [PASS][28] -> [DMESG-WARN][29] ([i915#1982])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk9/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk3/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +5 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#2122])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk8/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk1/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][34] -> [DMESG-WARN][35] ([i915#1982]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-glk:          [PASS][36] -> [FAIL][37] ([i915#49])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#109642] / [fdo#111068])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109441])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][42] -> [FAIL][43] ([i915#1542]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-iclb6/igt@perf@blocking-parameterized.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb8/igt@perf@blocking-parameterized.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [DMESG-WARN][44] ([i915#118] / [i915#95]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk1/igt@gem_exec_whisper@basic-forked-all.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc:
    - shard-iclb:         [INCOMPLETE][46] ([i915#2119] / [i915#926]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-iclb3/igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb3/igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-random:
    - shard-kbl:          [FAIL][48] ([i915#54]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
    - shard-apl:          [FAIL][50] ([i915#1635] / [i915#54]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-tglb:         [DMESG-WARN][52] ([i915#402]) -> [PASS][53] +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-tglb3/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-tglb8/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][54] ([i915#1982]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk9/igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a1-hdmi-a2.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk1/igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-tglb:         [DMESG-WARN][56] ([i915#1982]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][58] ([fdo#109441]) -> [PASS][59] +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@invalid:
    - shard-snb:          [TIMEOUT][60] ([i915#1958] / [i915#2119]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-snb2/igt@kms_vblank@invalid.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-snb4/igt@kms_vblank@invalid.html
    - shard-hsw:          [TIMEOUT][62] ([i915#1958] / [i915#2119]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-hsw2/igt@kms_vblank@invalid.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-hsw6/igt@kms_vblank@invalid.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][64] ([i915#180]) -> [PASS][65] +6 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-snb:          [TIMEOUT][66] ([i915#1958] / [i915#2119]) -> [SKIP][67] ([fdo#109271]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-snb2/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-snb2/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
    - shard-hsw:          [INCOMPLETE][68] -> [SKIP][69] ([fdo#109271])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-hsw2/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-hsw7/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-snb:          [SKIP][70] ([fdo#109271]) -> [TIMEOUT][71] ([i915#1958] / [i915#2119]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-snb6/igt@kms_flip@2x-wf_vblank-ts-check.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-snb4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-hsw:          [TIMEOUT][72] ([i915#1958] / [i915#2119]) -> [SKIP][73] ([fdo#109271])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-hsw:          [SKIP][74] ([fdo#109271]) -> [TIMEOUT][75] ([i915#1958] / [i915#2119]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-hsw7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-hsw7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@perf_pmu@busy-accuracy-50@vcs0:
    - shard-snb:          [SKIP][76] ([fdo#109271]) -> [SKIP][77] ([fdo#109271] / [i915#2119])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-snb5/igt@perf_pmu@busy-accuracy-50@vcs0.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-snb4/igt@perf_pmu@busy-accuracy-50@vcs0.html

  * igt@perf_pmu@busy-accuracy-50@vecs0:
    - shard-hsw:          [SKIP][78] ([fdo#109271]) -> [SKIP][79] ([fdo#109271] / [i915#2119])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-hsw1/igt@perf_pmu@busy-accuracy-50@vecs0.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-hsw7/igt@perf_pmu@busy-accuracy-50@vecs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#926]: https://gitlab.freedesktop.org/drm/intel/issues/926
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5736 -> IGTPW_4767

  CI-20190529: 20190529
  CI_DRM_8751: 5c4e78b5b9bac486fa56fb3305a789e61164a497 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4767: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/index.html
  IGT_5736: 32f8759b75ba5a06520f220d5d982b12d0cebd9f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/index.html

--===============3373898848112527313==
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
<tr><td><b>Series:</b></td><td>intel-ci: s/huc_copy/huc-copy/</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79530/">https://patchwork.freedesktop.org/series/79530/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5736_full -&gt; IGTPW_4767_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4767_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4767_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4767_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane_cursor@pipe-d-viewport-size-256:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-tglb8/igt@kms_plane_cursor@pipe-d-viewport-size-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-tglb3/igt@kms_plane_cursor@pipe-d-viewport-size-256.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@gem_huc_copy@huc-copy}:<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb5/igt@gem_huc_copy@huc-copy.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4767_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@execute-oneforall:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-tglb3/igt@gem_ctx_engines@execute-oneforall.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-tglb1/igt@gem_ctx_engines@execute-oneforall.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk6/igt@gem_exec_whisper@basic-queues-priority-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_flink_race@flink_close:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-iclb1/igt@gem_flink_race@flink_close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb2/igt@gem_flink_race@flink_close.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-apl3/igt@kms_big_fb@linear-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-apl1/igt@kms_big_fb@linear-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-kbl4/igt@kms_big_fb@linear-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-kbl7/igt@kms_big_fb@linear-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-hsw7/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-hsw7/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-snb4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-size-change:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk9/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk3/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk8/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk1/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb7/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-iclb6/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb8/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk1/igt@gem_exec_whisper@basic-forked-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-iclb3/igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/926">i915#926</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb3/igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x256-random:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-tglb3/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-tglb8/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-glk9/igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-glk1/igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a1-hdmi-a2.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@invalid:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-snb2/igt@kms_vblank@invalid.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-snb4/igt@kms_vblank@invalid.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-hsw2/igt@kms_vblank@invalid.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-hsw6/igt@kms_vblank@invalid.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> +6 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-snb2/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-snb2/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-hsw2/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-hsw7/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-snb6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-snb4/igt@kms_flip@2x-wf_vblank-ts-check.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-hsw7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-hsw7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-50@vcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-snb5/igt@perf_pmu@busy-accuracy-50@vcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-snb4/igt@perf_pmu@busy-accuracy-50@vcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-50@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5736/shard-hsw1/igt@perf_pmu@busy-accuracy-50@vecs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/shard-hsw7/igt@perf_pmu@busy-accuracy-50@vecs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5736 -&gt; IGTPW_4767</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8751: 5c4e78b5b9bac486fa56fb3305a789e61164a497 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4767: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4767/index.html<br />
  IGT_5736: 32f8759b75ba5a06520f220d5d982b12d0cebd9f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3373898848112527313==--

--===============1819952306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1819952306==--
