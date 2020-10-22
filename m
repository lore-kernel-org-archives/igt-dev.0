Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 22 Oct 2020 06:28:18 -0000
Message-ID: <160334809822.7803.3179748410371164763@emeril.freedesktop.org>
References: <20201022045215.15164-1-ranjeet1.kumar@intel.com>
In-Reply-To: <20201022045215.15164-1-ranjeet1.kumar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fbad=5Freloc=3A_Added_description_for_test_case?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0060114279=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: ranjeet1.kumar@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0060114279==
Content-Type: multipart/alternative;
 boundary="===============3907880452368552066=="

--===============3907880452368552066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_bad_reloc: Added description for test case
URL   : https://patchwork.freedesktop.org/series/82940/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9180_full -> IGTPW_5081_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5081_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5081_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5081_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@kms:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-hsw7/igt@gem_eio@kms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-hsw8/igt@gem_eio@kms.html

  * igt@gem_exec_schedule@preempt-queue-chain@vcs0:
    - shard-glk:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk1/igt@gem_exec_schedule@preempt-queue-chain@vcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk5/igt@gem_exec_schedule@preempt-queue-chain@vcs0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@core_hotunplug@hotrebind}:
    - shard-hsw:          NOTRUN -> [WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-hsw7/igt@core_hotunplug@hotrebind.html

  
Known issues
------------

  Here are the changes found in IGTPW_5081_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-active@all:
    - shard-hsw:          [PASS][6] -> [INCOMPLETE][7] ([i915#1888])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-hsw6/igt@gem_exec_reloc@basic-active@all.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-hsw4/igt@gem_exec_reloc@basic-active@all.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-glk:          [PASS][8] -> [FAIL][9] ([i915#2389])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk9/igt@gem_exec_reloc@basic-many-active@vcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk9/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [PASS][10] -> [DMESG-WARN][11] ([i915#118] / [i915#95]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk7/igt@gem_exec_whisper@basic-queues-all.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk3/igt@gem_exec_whisper@basic-queues-all.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge:
    - shard-glk:          [PASS][12] -> [DMESG-WARN][13] ([i915#1982]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk2/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][14] -> [FAIL][15] ([i915#2370]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-dp1:
    - shard-kbl:          [PASS][16] -> [DMESG-WARN][17] ([i915#1982]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-kbl1/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-kbl6/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [PASS][18] -> [DMESG-WARN][19] ([i915#1982]) +8 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][20] -> [SKIP][21] ([i915#433])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-position-hole-pipe-b-planes:
    - shard-kbl:          [PASS][22] -> [FAIL][23] ([i915#2472])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-kbl6/igt@kms_plane@plane-position-hole-pipe-b-planes.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-kbl7/igt@kms_plane@plane-position-hole-pipe-b-planes.html
    - shard-apl:          [PASS][24] -> [FAIL][25] ([i915#1635] / [i915#2472])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-apl3/igt@kms_plane@plane-position-hole-pipe-b-planes.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-apl4/igt@kms_plane@plane-position-hole-pipe-b-planes.html
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#2472])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk6/igt@kms_plane@plane-position-hole-pipe-b-planes.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk7/igt@kms_plane@plane-position-hole-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109441]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@enable-race@vecs0:
    - shard-tglb:         [PASS][32] -> [INCOMPLETE][33] ([i915#750])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-tglb7/igt@perf_pmu@enable-race@vecs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-tglb5/igt@perf_pmu@enable-race@vecs0.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-iclb:         [DMESG-WARN][34] ([i915#1982]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-iclb4/igt@core_hotunplug@unbind-rebind.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-iclb1/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_schedule@pi-common@bcs0:
    - shard-apl:          [INCOMPLETE][36] ([i915#1635]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-apl7/igt@gem_exec_schedule@pi-common@bcs0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-apl3/igt@gem_exec_schedule@pi-common@bcs0.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-iclb:         [INCOMPLETE][38] -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-iclb2/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-iclb2/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [DMESG-WARN][40] ([i915#118] / [i915#95]) -> [PASS][41] +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk1/igt@gem_exec_whisper@basic-forked-all.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk8/igt@gem_exec_whisper@basic-forked-all.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-kbl:          [FAIL][42] ([i915#2521]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-glk:          [FAIL][44] ([i915#2521]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk9/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk8/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][46] ([i915#118] / [i915#95]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][48] ([i915#1635] / [i915#1982]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-apl7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-apl4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-glk:          [FAIL][50] ([i915#54]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-apl:          [FAIL][52] ([i915#1635] / [i915#54]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-kbl:          [FAIL][54] ([i915#54]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-snb:          [SKIP][56] ([fdo#109271]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - shard-tglb:         [DMESG-WARN][58] ([i915#1982]) -> [PASS][59] +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-tglb1/igt@kms_flip@blocking-wf_vblank@a-edp1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-tglb8/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-glk:          [FAIL][60] ([i915#79]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-glk:          [FAIL][62] ([i915#49]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk7/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
    - shard-snb:          [FAIL][64] ([i915#2546]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-snb5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-snb7/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][66] ([fdo#109441]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [DMESG-WARN][68] ([i915#1982]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-kbl1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@perf@polling:
    - shard-glk:          [SKIP][70] ([fdo#109271] / [i915#1354]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk7/igt@perf@polling.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk2/igt@perf@polling.html
    - shard-tglb:         [SKIP][72] ([i915#1354]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-tglb3/igt@perf@polling.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-tglb3/igt@perf@polling.html
    - shard-apl:          [SKIP][74] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-apl6/igt@perf@polling.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-apl3/igt@perf@polling.html
    - shard-kbl:          [SKIP][76] ([fdo#109271] / [i915#1354]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-kbl2/igt@perf@polling.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-kbl4/igt@perf@polling.html
    - shard-hsw:          [SKIP][78] ([fdo#109271]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-hsw1/igt@perf@polling.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-hsw2/igt@perf@polling.html
    - shard-iclb:         [SKIP][80] ([i915#1354]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-iclb2/igt@perf@polling.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-iclb7/igt@perf@polling.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [FAIL][82] ([i915#1542]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-iclb5/igt@perf@polling-parameterized.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-iclb3/igt@perf@polling-parameterized.html

  * igt@prime_vgem@coherency-blt:
    - shard-hsw:          [FAIL][84] -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-hsw1/igt@prime_vgem@coherency-blt.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-hsw5/igt@prime_vgem@coherency-blt.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-tglb:         [DMESG-WARN][86] ([i915#1982] / [i915#2411]) -> [DMESG-WARN][87] ([i915#2411])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-tglb:         [DMESG-WARN][88] ([i915#2411]) -> [DMESG-WARN][89] ([i915#1982] / [i915#2411])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-tglb7/igt@kms_frontbuffer_tracking@psr-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-tglb5/igt@kms_frontbuffer_tracking@psr-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2472]: https://gitlab.freedesktop.org/drm/intel/issues/2472
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#750]: https://gitlab.freedesktop.org/drm/intel/issues/750
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5822 -> IGTPW_5081
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9180: b174cec7fd714a954d4a65088ca53e32ae9cd45e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5081: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/index.html
  IGT_5822: b4bcf05cb9839037128905deda7146434155cc41 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/index.html

--===============3907880452368552066==
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
<tr><td><b>Series:</b></td><td>i915/gem_bad_reloc: Added description for test case</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82940/">https://patchwork.freedesktop.org/series/82940/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9180_full -&gt; IGTPW_5081_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5081_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5081_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5081_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-hsw7/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-hsw8/igt@gem_eio@kms.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk1/igt@gem_exec_schedule@preempt-queue-chain@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk5/igt@gem_exec_schedule@preempt-queue-chain@vcs0.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@core_hotunplug@hotrebind}:<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-hsw7/igt@core_hotunplug@hotrebind.html">WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5081_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-active@all:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-hsw6/igt@gem_exec_reloc@basic-active@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-hsw4/igt@gem_exec_reloc@basic-active@all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk9/igt@gem_exec_reloc@basic-many-active@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk9/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk7/igt@gem_exec_whisper@basic-queues-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk3/igt@gem_exec_whisper@basic-queues-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk2/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-kbl1/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-kbl6/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-pipe-b-planes:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-kbl6/igt@kms_plane@plane-position-hole-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-kbl7/igt@kms_plane@plane-position-hole-pipe-b-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2472">i915#2472</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-apl3/igt@kms_plane@plane-position-hole-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-apl4/igt@kms_plane@plane-position-hole-pipe-b-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2472">i915#2472</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk6/igt@kms_plane@plane-position-hole-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk7/igt@kms_plane@plane-position-hole-pipe-b-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2472">i915#2472</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-iclb1/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@enable-race@vecs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-tglb7/igt@perf_pmu@enable-race@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-tglb5/igt@perf_pmu@enable-race@vecs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/750">i915#750</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-iclb4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-iclb1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-common@bcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-apl7/igt@gem_exec_schedule@pi-common@bcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-apl3/igt@gem_exec_schedule@pi-common@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-iclb2/igt@gem_exec_whisper@basic-contexts-priority-all.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-iclb2/igt@gem_exec_whisper@basic-contexts-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk1/igt@gem_exec_whisper@basic-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk8/igt@gem_exec_whisper@basic-forked-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk9/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk8/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-apl7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-apl4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-tglb1/igt@kms_flip@blocking-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-tglb8/igt@kms_flip@blocking-wf_vblank@a-edp1.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk7/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-snb5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-snb7/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-kbl1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-glk7/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-glk2/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-tglb3/igt@perf@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-tglb3/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-apl6/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-apl3/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-kbl2/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-kbl4/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-hsw1/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-hsw2/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-iclb2/igt@perf@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-iclb7/igt@perf@polling.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-iclb5/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-iclb3/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-blt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-hsw1/igt@prime_vgem@coherency-blt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-hsw5/igt@prime_vgem@coherency-blt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9180/shard-tglb7/igt@kms_frontbuffer_tracking@psr-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/shard-tglb5/igt@kms_frontbuffer_tracking@psr-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
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
<li>IGT: IGT_5822 -&gt; IGTPW_5081</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9180: b174cec7fd714a954d4a65088ca53e32ae9cd45e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5081: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5081/index.html<br />
  IGT_5822: b4bcf05cb9839037128905deda7146434155cc41 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3907880452368552066==--

--===============0060114279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0060114279==--
