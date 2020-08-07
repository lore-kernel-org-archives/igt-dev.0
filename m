Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 07 Aug 2020 13:26:45 -0000
Message-ID: <159680680518.26558.8334290432874138203@emeril.freedesktop.org>
References: <20200807084506.473089-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200807084506.473089-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Ffence=3A_Use_default-context_for_syncobj-timeline-w?=
 =?utf-8?q?ait?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2095134458=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2095134458==
Content-Type: multipart/alternative;
 boundary="===============2213806926531422938=="

--===============2213806926531422938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_fence: Use default-context for syncobj-timeline-wait
URL   : https://patchwork.freedesktop.org/series/80379/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8854_full -> IGTPW_4866_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4866_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4866_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4866_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-tglb2/igt@runner@aborted.html
    - shard-snb:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-snb5/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_fence@invalid-timeline-fence-array}:
    - shard-hsw:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw7/igt@gem_exec_fence@invalid-timeline-fence-array.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw5/igt@gem_exec_fence@invalid-timeline-fence-array.html

  
Known issues
------------

  Here are the changes found in IGTPW_4866_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([i915#1602] / [i915#750])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-tglb8/igt@device_reset@unbind-reset-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-tglb2/igt@device_reset@unbind-reset-rebind.html
    - shard-snb:          [PASS][7] -> [INCOMPLETE][8] ([i915#82])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-snb1/igt@device_reset@unbind-reset-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-snb5/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2261])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk3/igt@gem_partial_pwrite_pread@reads-uncached.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk9/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([i915#42])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-snb4/igt@gem_workarounds@suspend-resume-context.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-snb5/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - shard-hsw:          [PASS][15] -> [TIMEOUT][16] ([i915#1958]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw7/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw5/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][17] -> [DMESG-FAIL][18] ([i915#118] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][21] -> [INCOMPLETE][22] ([i915#2055])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk6/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#49])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#1635] / [i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-apl4/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-apl8/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk2/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk6/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#1635] / [i915#1982]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-apl3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-apl3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-pipe-c-planes:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#1036])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk6/igt@kms_plane@plane-panning-bottom-right-pipe-c-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk6/igt@kms_plane@plane-panning-bottom-right-pipe-c-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-iclb5/igt@kms_psr@psr2_cursor_render.html

  * igt@prime_busy@after@vecs0:
    - shard-hsw:          [PASS][39] -> [FAIL][40] ([i915#2258]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw8/igt@prime_busy@after@vecs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw6/igt@prime_busy@after@vecs0.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-glk:          [DMESG-WARN][41] ([i915#118] / [i915#95]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk6/igt@gem_exec_whisper@basic-fds-forked-all.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk8/igt@gem_exec_whisper@basic-fds-forked-all.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-hsw:          [INCOMPLETE][43] -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw2/igt@gem_exec_whisper@basic-forked-all.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw6/igt@gem_exec_whisper@basic-forked-all.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][45] ([i915#1436] / [i915#1635] / [i915#716]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-apl7/igt@gen9_exec_parse@allowed-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-apl4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [INCOMPLETE][47] -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-iclb4/igt@i915_pm_dc@dc5-psr.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-iclb5/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [INCOMPLETE][49] ([i915#155]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge:
    - shard-glk:          [DMESG-WARN][51] ([i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk7/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk5/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [DMESG-WARN][53] ([i915#1982]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-glk:          [FAIL][55] ([i915#49]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-tglb:         [DMESG-WARN][57] ([i915#1982]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][61] ([fdo#109441]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][63] ([i915#31]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw6/igt@kms_setmode@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw8/igt@kms_setmode@basic.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][65] ([i915#1542]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-iclb7/igt@perf@blocking-parameterized.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-iclb6/igt@perf@blocking-parameterized.html

  * igt@perf@polling-parameterized:
    - shard-kbl:          [FAIL][67] ([i915#1542]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-kbl1/igt@perf@polling-parameterized.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-kbl1/igt@perf@polling-parameterized.html

  * igt@prime_busy@after-wait@vcs0:
    - shard-hsw:          [FAIL][69] ([i915#2258]) -> [PASS][70] +4 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw2/igt@prime_busy@after-wait@vcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw5/igt@prime_busy@after-wait@vcs0.html

  * {igt@syncobj_timeline@etime-multi-wait-all-for-submit-submitted}:
    - shard-hsw:          [TIMEOUT][71] ([i915#1958]) -> [PASS][72] +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw5/igt@syncobj_timeline@etime-multi-wait-all-for-submit-submitted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw2/igt@syncobj_timeline@etime-multi-wait-all-for-submit-submitted.html

  
#### Warnings ####

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-hsw:          [TIMEOUT][73] ([i915#1958]) -> [SKIP][74] ([fdo#109271] / [fdo#111827])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw5/igt@kms_color_chamelium@pipe-b-ctm-0-5.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw8/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-hsw:          [SKIP][75] ([fdo#109271]) -> [TIMEOUT][76] ([i915#1958])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][77], [FAIL][78]) ([fdo#109271] / [i915#1635] / [i915#2110] / [i915#716]) -> [FAIL][79] ([i915#1635] / [i915#2110])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-apl4/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-apl7/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-apl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1036]: https://gitlab.freedesktop.org/drm/intel/issues/1036
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#2261]: https://gitlab.freedesktop.org/drm/intel/issues/2261
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#750]: https://gitlab.freedesktop.org/drm/intel/issues/750
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5764 -> IGTPW_4866
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8854: 067ee09cd0a99c5ef86d0f780d7448ec416c036d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4866: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/index.html
  IGT_5764: 0f91c80b4c809cf48afff65a2ea68590389aa5ba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/index.html

--===============2213806926531422938==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_fence: Use default-context for syncobj-timeline-wait</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80379/">https://patchwork.freedesktop.org/series/80379/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8854_full -&gt; IGTPW_4866_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4866_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4866_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4866_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-tglb2/igt@runner@aborted.html">FAIL</a></p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-snb5/igt@runner@aborted.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@gem_exec_fence@invalid-timeline-fence-array}:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw7/igt@gem_exec_fence@invalid-timeline-fence-array.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw5/igt@gem_exec_fence@invalid-timeline-fence-array.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4866_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-tglb8/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-tglb2/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/750">i915#750</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-snb1/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-snb5/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk3/igt@gem_partial_pwrite_pread@reads-uncached.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk9/igt@gem_partial_pwrite_pread@reads-uncached.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2261">i915#2261</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-snb4/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-snb5/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/42">i915#42</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw7/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw5/igt@kms_addfb_basic@addfb25-bad-modifier.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk6/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-apl4/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-apl8/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk2/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk6/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-apl3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-apl3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-pipe-c-planes:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk6/igt@kms_plane@plane-panning-bottom-right-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk6/igt@kms_plane@plane-panning-bottom-right-pipe-c-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1036">i915#1036</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-iclb5/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_busy@after@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw8/igt@prime_busy@after@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw6/igt@prime_busy@after@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk6/igt@gem_exec_whisper@basic-fds-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk8/igt@gem_exec_whisper@basic-fds-forked-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw2/igt@gem_exec_whisper@basic-forked-all.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw6/igt@gem_exec_whisper@basic-forked-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-apl7/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-apl4/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-iclb4/igt@i915_pm_dc@dc5-psr.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-iclb5/igt@i915_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk7/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk5/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw6/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw8/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-iclb7/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-iclb6/igt@perf@blocking-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-kbl1/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-kbl1/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@after-wait@vcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw2/igt@prime_busy@after-wait@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw5/igt@prime_busy@after-wait@vcs0.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>{igt@syncobj_timeline@etime-multi-wait-all-for-submit-submitted}:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw5/igt@syncobj_timeline@etime-multi-wait-all-for-submit-submitted.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw2/igt@syncobj_timeline@etime-multi-wait-all-for-submit-submitted.html">PASS</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw5/igt@kms_color_chamelium@pipe-b-ctm-0-5.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw8/igt@kms_color_chamelium@pipe-b-ctm-0-5.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-hsw8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-hsw5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8854/shard-apl7/igt@runner@aborted.html">FAIL</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/shard-apl1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</li>
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
<li>IGT: IGT_5764 -&gt; IGTPW_4866</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8854: 067ee09cd0a99c5ef86d0f780d7448ec416c036d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4866: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4866/index.html<br />
  IGT_5764: 0f91c80b4c809cf48afff65a2ea68590389aa5ba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============2213806926531422938==--

--===============2095134458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2095134458==--
