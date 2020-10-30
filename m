Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 30 Oct 2020 14:33:22 -0000
Message-ID: <160406840233.23389.8258915890593971151@emeril.freedesktop.org>
References: <20201030113653.3605117-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201030113653.3605117-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib=3A_Export_drm=5Fload=5Fmod?=
 =?utf-8?b?dWxlKCk=?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0765437186=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0765437186==
Content-Type: multipart/alternative;
 boundary="===============5768459622906379529=="

--===============5768459622906379529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] lib: Export drm_load_module()
URL   : https://patchwork.freedesktop.org/series/83272/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9227_full -> IGTPW_5110_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5110_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5110_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5110_full:

### IGT changes ###

#### Possible regressions ####

  * igt@perf_pmu@rc6-runtime-pm-long:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-hsw8/igt@perf_pmu@rc6-runtime-pm-long.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-hsw6/igt@perf_pmu@rc6-runtime-pm-long.html

  
Known issues
------------

  Here are the changes found in IGTPW_5110_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-hsw:          [PASS][3] -> [FAIL][4] ([i915#1888])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-hsw6/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-hsw8/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-snb:          [PASS][5] -> [INCOMPLETE][6] ([i915#82])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-snb6/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-snb2/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][7] -> [DMESG-WARN][8] ([i915#1982]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-tglb5/igt@i915_module_load@reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-tglb1/igt@i915_module_load@reload.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][9] -> [WARN][10] ([i915#1519])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-hsw7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#1982]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-glk9/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#2346])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1635] / [i915#1982]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-apl3/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-apl3/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-iclb:         [PASS][19] -> [INCOMPLETE][20] ([i915#1185])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109441]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb2/igt@kms_psr@psr2_dpms.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb1/igt@kms_psr@psr2_dpms.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#31])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl6/igt@kms_setmode@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl6/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +6 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl3/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@perf@invalid-oa-exponent:
    - shard-hsw:          [PASS][27] -> [SKIP][28] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-hsw2/igt@perf@invalid-oa-exponent.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-hsw5/igt@perf@invalid-oa-exponent.html
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([i915#1354])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb5/igt@perf@invalid-oa-exponent.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb1/igt@perf@invalid-oa-exponent.html
    - shard-glk:          [PASS][31] -> [SKIP][32] ([fdo#109271] / [i915#1354])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-glk7/igt@perf@invalid-oa-exponent.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-glk7/igt@perf@invalid-oa-exponent.html
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([i915#1354])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-tglb8/igt@perf@invalid-oa-exponent.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-tglb2/igt@perf@invalid-oa-exponent.html
    - shard-apl:          [PASS][35] -> [SKIP][36] ([fdo#109271] / [i915#1354] / [i915#1635])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-apl2/igt@perf@invalid-oa-exponent.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-apl6/igt@perf@invalid-oa-exponent.html
    - shard-kbl:          [PASS][37] -> [SKIP][38] ([fdo#109271] / [i915#1354])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl2/igt@perf@invalid-oa-exponent.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl3/igt@perf@invalid-oa-exponent.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-snb:          [INCOMPLETE][39] ([i915#82]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-snb7/igt@core_hotunplug@hotrebind-lateclose.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-snb7/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@info:
    - shard-iclb:         [SKIP][41] ([i915#2582]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb7/igt@fbdev@info.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb1/igt@fbdev@info.html
    - shard-snb:          [SKIP][43] ([fdo#109271]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-snb2/igt@fbdev@info.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-snb5/igt@fbdev@info.html
    - shard-hsw:          [SKIP][45] ([fdo#109271]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-hsw4/igt@fbdev@info.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-hsw4/igt@fbdev@info.html
    - shard-tglb:         [SKIP][47] ([i915#2582]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-tglb1/igt@fbdev@info.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-tglb8/igt@fbdev@info.html
    - shard-kbl:          [SKIP][49] ([fdo#109271]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl3/igt@fbdev@info.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl4/igt@fbdev@info.html
    - shard-apl:          [SKIP][51] ([fdo#109271] / [i915#1635]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-apl6/igt@fbdev@info.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-apl3/igt@fbdev@info.html
    - shard-glk:          [SKIP][53] ([fdo#109271]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-glk9/igt@fbdev@info.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-glk2/igt@fbdev@info.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][55] ([i915#658]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb6/igt@feature_discovery@psr2.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][57] ([i915#2389]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-glk4/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][59] ([i915#454]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][61] ([i915#1515]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-kbl:          [FAIL][63] ([i915#2521]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl7/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl2/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-glk:          [FAIL][65] ([i915#2521]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-glk1/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-apl:          [FAIL][67] ([i915#1635] / [i915#2521]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-apl1/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-apl4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * {igt@kms_async_flips@test-time-stamp}:
    - shard-tglb:         [FAIL][69] ([i915#2597]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-tglb1/igt@kms_async_flips@test-time-stamp.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-tglb1/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_cursor_crc@pipe-c-cursor-dpms:
    - shard-glk:          [FAIL][71] ([i915#54]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
    - shard-apl:          [FAIL][73] ([i915#1635] / [i915#54]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
    - shard-kbl:          [FAIL][75] ([i915#54]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-dpms.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:
    - shard-apl:          [DMESG-WARN][77] ([i915#1635] / [i915#1982]) -> [PASS][78] +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-apl6/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-apl6/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-tglb:         [DMESG-WARN][79] ([i915#1982]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-tglb8/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-tglb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][81] ([i915#2370]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-glk:          [DMESG-WARN][83] ([i915#1982]) -> [PASS][84] +9 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-glk2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-glk1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-apl:          [FAIL][85] ([i915#1635] / [i915#79]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][89] ([i915#433]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-kbl:          [DMESG-WARN][91] ([i915#1982]) -> [PASS][92] +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl7/igt@kms_plane_lowres@pipe-b-tiling-y.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl3/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][93] ([fdo#109642] / [fdo#111068]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb6/igt@kms_psr2_su@page_flip.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [SKIP][95] ([fdo#109441]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb7/igt@kms_psr@psr2_primary_render.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb2/igt@kms_psr@psr2_primary_render.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-hsw:          [FAIL][97] -> [WARN][98] ([i915#2283])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-hsw7/igt@core_hotunplug@hotrebind-lateclose.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-hsw5/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-iclb:         [SKIP][99] ([i915#2612]) -> [FAIL][100] ([i915#183])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb1/igt@gem_tiled_swapping@non-threaded.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb2/igt@gem_tiled_swapping@non-threaded.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#183]: https://gitlab.freedesktop.org/drm/intel/issues/183
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2612]: https://gitlab.freedesktop.org/drm/intel/issues/2612
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5828 -> IGTPW_5110
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9227: d6f64cb8b9ef0b9235b08cc6e3ec30db8ea197d2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5110: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/index.html
  IGT_5828: db972bdaab8ada43b742bc9621bb0fc9d56a6fc6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/index.html

--===============5768459622906379529==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] lib: Export drm_load_module()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83272/">https://patchwork.freedesktop.org/series/83272/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9227_full -&gt; IGTPW_5110_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5110_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5110_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5110_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@perf_pmu@rc6-runtime-pm-long:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-hsw8/igt@perf_pmu@rc6-runtime-pm-long.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-hsw6/igt@perf_pmu@rc6-runtime-pm-long.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5110_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-hsw6/igt@gem_userptr_blits@unsync-unmap-cycles.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-hsw8/igt@gem_userptr_blits@unsync-unmap-cycles.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-snb6/igt@gem_userptr_blits@unsync-unmap-cycles.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-snb2/igt@gem_userptr_blits@unsync-unmap-cycles.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-tglb5/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-tglb1/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-hsw7/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-glk9/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-apl3/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-apl3/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb2/igt@kms_psr@psr2_dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb1/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl6/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl3/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-exponent:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-hsw2/igt@perf@invalid-oa-exponent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-hsw5/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb5/igt@perf@invalid-oa-exponent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb1/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-glk7/igt@perf@invalid-oa-exponent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-glk7/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-tglb8/igt@perf@invalid-oa-exponent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-tglb2/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-apl2/igt@perf@invalid-oa-exponent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-apl6/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl2/igt@perf@invalid-oa-exponent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl3/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-snb7/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-snb7/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb7/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb1/igt@fbdev@info.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-snb2/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-snb5/igt@fbdev@info.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-hsw4/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-hsw4/igt@fbdev@info.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-tglb1/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-tglb8/igt@fbdev@info.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl3/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl4/igt@fbdev@info.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-apl6/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-apl3/igt@fbdev@info.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-glk9/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-glk2/igt@fbdev@info.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb6/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-glk4/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl7/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl2/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-glk1/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-apl1/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-apl4/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@test-time-stamp}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-tglb1/igt@kms_async_flips@test-time-stamp.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2597">i915#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-tglb1/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-dpms:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-dpms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-apl6/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-apl6/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-tglb8/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-tglb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-glk2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-glk1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-y:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-kbl7/igt@kms_plane_lowres@pipe-b-tiling-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-kbl3/igt@kms_plane_lowres@pipe-b-tiling-y.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb6/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb7/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-hsw7/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-hsw5/igt@core_hotunplug@hotrebind-lateclose.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9227/shard-iclb1/igt@gem_tiled_swapping@non-threaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2612">i915#2612</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/shard-iclb2/igt@gem_tiled_swapping@non-threaded.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/183">i915#183</a>)</li>
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
<li>IGT: IGT_5828 -&gt; IGTPW_5110</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9227: d6f64cb8b9ef0b9235b08cc6e3ec30db8ea197d2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5110: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5110/index.html<br />
  IGT_5828: db972bdaab8ada43b742bc9621bb0fc9d56a6fc6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5768459622906379529==--

--===============0765437186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0765437186==--
