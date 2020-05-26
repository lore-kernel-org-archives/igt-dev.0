Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 26 May 2020 18:22:32 -0000
Message-ID: <159051735253.28043.285993664843891289@emeril.freedesktop.org>
References: <20200526130018.20163-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200526130018.20163-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliOiBS?=
 =?utf-8?q?andomise_spinner_location_to_reduce_relocation_risk?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: Randomise spinner location to reduce relocation risk
URL   : https://patchwork.freedesktop.org/series/77662/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8539_full -> IGTPW_4613_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4613_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4613_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4613_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-hsw6/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4613_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][2] -> [DMESG-WARN][3] ([i915#1436] / [i915#716])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-apl1/igt@gen9_exec_parse@allowed-all.html
    - shard-glk:          [PASS][4] -> [DMESG-WARN][5] ([i915#1436] / [i915#716])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][6] -> [FAIL][7] ([i915#1899]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][8] -> [DMESG-WARN][9] ([i915#180])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl2/igt@i915_suspend@sysfs-reader.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-apl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#1119] / [i915#118] / [i915#95])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-kbl:          [PASS][12] -> [FAIL][13] ([i915#54] / [i915#93] / [i915#95])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][14] -> [DMESG-WARN][15] ([i915#180]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][16] -> [SKIP][17] ([i915#433])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][18] -> [FAIL][19] ([i915#83])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb4/igt@kms_panel_fitting@atomic-fastset.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#109441]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-iclb8/igt@kms_psr@psr2_no_drrs.html

  * igt@syncobj_wait@single-wait-for-submit-unsubmitted:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#1927])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk5/igt@syncobj_wait@single-wait-for-submit-unsubmitted.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-glk4/igt@syncobj_wait@single-wait-for-submit-unsubmitted.html

  
#### Possible fixes ####

  * {igt@gem_exec_endless@dispatch@vcs0}:
    - shard-apl:          [SKIP][24] ([fdo#109271]) -> [PASS][25] +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl4/igt@gem_exec_endless@dispatch@vcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-apl6/igt@gem_exec_endless@dispatch@vcs0.html
    - shard-glk:          [SKIP][26] ([fdo#109271]) -> [PASS][27] +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk7/igt@gem_exec_endless@dispatch@vcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-glk4/igt@gem_exec_endless@dispatch@vcs0.html

  * {igt@gem_exec_endless@dispatch@vcs1}:
    - shard-tglb:         [SKIP][28] ([i915#1929]) -> [PASS][29] +4 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-tglb8/igt@gem_exec_endless@dispatch@vcs1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-tglb2/igt@gem_exec_endless@dispatch@vcs1.html
    - shard-kbl:          [SKIP][30] ([fdo#109271]) -> [PASS][31] +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl6/igt@gem_exec_endless@dispatch@vcs1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-kbl2/igt@gem_exec_endless@dispatch@vcs1.html

  * {igt@gem_exec_endless@dispatch@vecs0}:
    - shard-iclb:         [SKIP][32] ([i915#1929]) -> [PASS][33] +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb2/igt@gem_exec_endless@dispatch@vecs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-iclb7/igt@gem_exec_endless@dispatch@vecs0.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][34] ([i915#1904]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-kbl:          [FAIL][36] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [FAIL][38] ([i915#1119] / [i915#118] / [i915#95]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-glk9/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [FAIL][40] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [INCOMPLETE][42] ([i915#61]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [DMESG-FAIL][44] ([i915#1925]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-glk4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1}:
    - shard-kbl:          [DMESG-WARN][46] ([i915#180]) -> [PASS][47] +5 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * {igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1}:
    - shard-apl:          [FAIL][48] ([i915#407]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl7/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-apl1/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][50] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][52] ([i915#180]) -> [PASS][53] +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][54] ([fdo#109441]) -> [PASS][55] +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][56] ([i915#1542]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb1/igt@perf@blocking-parameterized.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-iclb2/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][58] ([i915#588]) -> [SKIP][59] ([i915#658])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][60] ([i915#468]) -> [FAIL][61] ([i915#454])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][62] ([i915#454]) -> [FAIL][63] ([i915#1899])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-tglb1/igt@i915_pm_dc@dc6-psr.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_busy@basic-modeset-pipe-d:
    - shard-apl:          [TIMEOUT][64] ([i915#1635]) -> [SKIP][65] ([fdo#109271])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl7/igt@kms_busy@basic-modeset-pipe-d.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-apl7/igt@kms_busy@basic-modeset-pipe-d.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][66] ([i915#1319] / [i915#1635]) -> [FAIL][67] ([fdo#110321] / [fdo#110336])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-FAIL][68] ([i915#1925]) -> [DMESG-WARN][69] ([i915#1926])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-glk8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-glk4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          [FAIL][70] ([fdo#108145] / [i915#265]) -> [FAIL][71] ([fdo#108145] / [i915#265] / [i915#95])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          [FAIL][72] ([fdo#108145] / [i915#265]) -> [FAIL][73] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8539/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1929]: https://gitlab.freedesktop.org/drm/intel/issues/1929
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5678 -> IGTPW_4613
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8539: 6590da76d8c6a2952b3cde70859bad41c59ed444 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4613: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/index.html
  IGT_5678: c1f30ee09ac2e7eb3e8e90245239731a169a6050 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4613/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
