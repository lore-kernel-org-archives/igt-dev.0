Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 May 2020 16:42:00 -0000
Message-ID: <158990652055.31236.1906488590281851982@emeril.freedesktop.org>
References: <20200519105408.10565-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200519105408.10565-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fparams=3A_Fix_verifying_of_debugfs_parameters?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_params: Fix verifying of debugfs parameters
URL   : https://patchwork.freedesktop.org/series/77409/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8501_full -> IGTPW_4586_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4586_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4586_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4586_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@clone:
    - shard-kbl:          [PASS][1] -> [FAIL][2] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl3/igt@gem_ctx_persistence@clone.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-kbl2/igt@gem_ctx_persistence@clone.html

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-kbl:          NOTRUN -> [FAIL][3] +18 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-kbl2/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-iclb:         NOTRUN -> [FAIL][4] +18 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-iclb4/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@file:
    - shard-tglb:         [PASS][5] -> [FAIL][6] +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb5/igt@gem_ctx_persistence@file.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-tglb3/igt@gem_ctx_persistence@file.html
    - shard-glk:          [PASS][7] -> [FAIL][8] +6 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-glk4/igt@gem_ctx_persistence@file.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-glk8/igt@gem_ctx_persistence@file.html

  * igt@gem_ctx_persistence@hostile:
    - shard-apl:          [PASS][9] -> [FAIL][10] +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl6/igt@gem_ctx_persistence@hostile.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-apl3/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hostile:
    - shard-glk:          NOTRUN -> [FAIL][11] +18 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-glk6/igt@gem_ctx_persistence@legacy-engines-hostile.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-tglb:         NOTRUN -> [FAIL][12] +18 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-tglb8/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_persistence@process:
    - shard-iclb:         [PASS][13] -> [FAIL][14] +8 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb2/igt@gem_ctx_persistence@process.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-iclb7/igt@gem_ctx_persistence@process.html

  * igt@gem_ctx_persistence@replace:
    - shard-apl:          NOTRUN -> [FAIL][15] +18 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-apl7/igt@gem_ctx_persistence@replace.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@hang:
    - shard-apl:          [SKIP][16] ([fdo#109271]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl4/igt@gem_ctx_persistence@hang.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-apl1/igt@gem_ctx_persistence@hang.html
    - shard-glk:          [SKIP][18] ([fdo#109271]) -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-glk9/igt@gem_ctx_persistence@hang.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-glk4/igt@gem_ctx_persistence@hang.html
    - shard-kbl:          [SKIP][20] ([fdo#109271]) -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl4/igt@gem_ctx_persistence@hang.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-kbl4/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          [SKIP][22] ([fdo#109271] / [i915#1099]) -> [FAIL][23] +23 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_persistence@saturated-hostile:
    - shard-snb:          [SKIP][24] ([fdo#109271]) -> [FAIL][25] +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-snb6/igt@gem_ctx_persistence@saturated-hostile.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-snb6/igt@gem_ctx_persistence@saturated-hostile.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [FAIL][26] ([i915#608]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb5/igt@kms_psr2_su@page_flip.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-tglb6/igt@kms_psr2_su@page_flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_4586_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [PASS][28] -> [FAIL][29] ([i915#93] / [i915#95]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-kbl7/igt@gem_ctx_persistence@close-replace-race.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#454])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_color@pipe-b-degamma:
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([i915#71])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl1/igt@kms_color@pipe-b-degamma.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-kbl3/igt@kms_color@pipe-b-degamma.html
    - shard-apl:          [PASS][34] -> [FAIL][35] ([i915#71])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl7/igt@kms_color@pipe-b-degamma.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-apl7/igt@kms_color@pipe-b-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][36] -> [FAIL][37] ([i915#54] / [i915#93] / [i915#95]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][38] -> [FAIL][39] ([i915#1566] / [i915#93] / [i915#95])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][40] -> [DMESG-WARN][41] ([i915#180])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([fdo#109441]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-iclb8/igt@kms_psr@psr2_no_drrs.html

  
#### Possible fixes ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][44] ([i915#1904]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color@pipe-c-degamma:
    - shard-apl:          [FAIL][46] ([i915#71]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl6/igt@kms_color@pipe-c-degamma.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-apl8/igt@kms_color@pipe-c-degamma.html
    - shard-glk:          [FAIL][48] ([i915#71]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-glk7/igt@kms_color@pipe-c-degamma.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-glk8/igt@kms_color@pipe-c-degamma.html
    - shard-kbl:          [FAIL][50] ([i915#71]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_color@pipe-c-degamma.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-kbl4/igt@kms_color@pipe-c-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][52] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglb:         [FAIL][54] ([i915#1121]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb5/igt@kms_fbcon_fbt@psr-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-tglb7/igt@kms_fbcon_fbt@psr-suspend.html

  * {igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][56] ([i915#79]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][58] ([i915#180]) -> [PASS][59] +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +5 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [FAIL][62] ([i915#1559] / [i915#95]) -> [PASS][63] +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [FAIL][64] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][66] ([fdo#109441]) -> [PASS][67] +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * {igt@perf@polling-parameterized}:
    - shard-tglb:         [FAIL][68] ([i915#1542]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb7/igt@perf@polling-parameterized.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-tglb2/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][70] ([i915#658]) -> [SKIP][71] ([i915#588])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][72] ([i915#454]) -> [FAIL][73] ([i915#454] / [i915#93] / [i915#95])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html
    - shard-tglb:         [FAIL][74] ([i915#454]) -> [SKIP][75] ([i915#468])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][76] ([i915#1319]) -> [FAIL][77] ([fdo#110321] / [fdo#110336])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl3/igt@kms_content_protection@atomic.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-apl3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][78] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][79] ([i915#1319])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-apl2/igt@kms_content_protection@atomic-dpms.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][80] ([i915#180]) -> [INCOMPLETE][81] ([i915#155])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5659 -> IGTPW_4586
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8501: c6bfff03c22fb90dcf1ddacb745667467ab5ab73 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4586: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/index.html
  IGT_5659: 66ab5e42811fee3dea8c21ab29e70e323a0650de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
