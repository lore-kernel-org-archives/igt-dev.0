Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 29 May 2020 16:53:03 -0000
Message-ID: <159077118387.3334.9523153032752398855@emeril.freedesktop.org>
References: <20200529135802.1286704-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200529135802.1286704-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fbalancer=3A_Randomise_bonded_submission_=28rev3=29?=
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

Series: i915/gem_exec_balancer: Randomise bonded submission (rev3)
URL   : https://patchwork.freedesktop.org/series/77701/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8553_full -> IGTPW_4624_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4624_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4624_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4624_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_busy@close-race:
    - shard-hsw:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-hsw2/igt@gem_busy@close-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-hsw4/igt@gem_busy@close-race.html

  * {igt@gem_exec_balancer@bonded-dual} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-iclb2/igt@gem_exec_balancer@bonded-dual.html
    - shard-tglb:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-tglb1/igt@gem_exec_balancer@bonded-dual.html

  * {igt@gem_exec_balancer@bonded-pair} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-kbl4/igt@gem_exec_balancer@bonded-pair.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8553_full and IGTPW_4624_full:

### New IGT tests (2) ###

  * igt@gem_exec_balancer@bonded-dual:
    - Statuses : 3 fail(s) 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 33.09] s

  * igt@gem_exec_balancer@bonded-pair:
    - Statuses : 1 fail(s) 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 32.42] s

  

Known issues
------------

  Here are the changes found in IGTPW_4624_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][6] -> [FAIL][7] ([i915#1899])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][8] -> [FAIL][9] ([i915#54])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-apl:          [PASS][10] -> [FAIL][11] ([i915#54])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][12] -> [DMESG-FAIL][13] ([i915#1926])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][14] -> [INCOMPLETE][15] ([i915#155])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-position-covered-pipe-c-planes:
    - shard-kbl:          [PASS][16] -> [DMESG-WARN][17] ([i915#165] / [i915#78])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-kbl2/igt@kms_plane@plane-position-covered-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([fdo#108145] / [i915#265] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [PASS][20] -> [SKIP][21] ([i915#1911])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-tglb5/igt@kms_psr2_su@frontbuffer.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-tglb1/igt@kms_psr2_su@frontbuffer.html
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([fdo#109642] / [fdo#111068])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-iclb4/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([fdo#109441])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-iclb5/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-iclb:         [PASS][26] -> [INCOMPLETE][27] ([i915#1078] / [i915#1185])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-iclb6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-b-accuracy-idle:
    - shard-glk:          [PASS][28] -> [TIMEOUT][29] ([i915#1958]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-glk6/igt@kms_vblank@pipe-b-accuracy-idle.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-glk8/igt@kms_vblank@pipe-b-accuracy-idle.html

  
#### Possible fixes ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [INCOMPLETE][30] ([i915#1959]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-kbl6/igt@gem_softpin@noreloc-s3.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-kbl1/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][32] ([i915#1904]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][34] ([i915#1899]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-iclb4/igt@i915_pm_dc@dc5-psr.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-iclb1/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [DMESG-WARN][36] ([i915#180]) -> [PASS][37] +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html

  * {igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-c}:
    - shard-kbl:          [DMESG-WARN][38] ([i915#165] / [i915#180]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-kbl2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-c.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-kbl1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-c.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-FAIL][40] ([i915#1925] / [i915#1926]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-glk1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-kbl:          [FAIL][42] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][43] +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][44] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][45] +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [INCOMPLETE][46] ([i915#1185]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-iclb3/igt@kms_fbcon_fbt@psr-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-iclb6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][48] ([i915#433]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [FAIL][50] ([i915#83]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-tglb5/igt@kms_panel_fitting@atomic-fastset.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-tglb5/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [FAIL][52] ([i915#83]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-iclb2/igt@kms_panel_fitting@atomic-fastset.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-apl:          [FAIL][54] ([i915#1559] / [i915#95]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][56] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][58] ([fdo#109441]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-kbl:          [INCOMPLETE][62] ([i915#155]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf@mi-rpc:
    - shard-hsw:          [INCOMPLETE][64] ([i915#61]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-hsw5/igt@perf@mi-rpc.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-hsw7/igt@perf@mi-rpc.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][66] ([i915#1542]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-hsw6/igt@perf@polling-parameterized.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-hsw7/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][68] ([i915#454]) -> [FAIL][69] ([i915#1899])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-tglb1/igt@i915_pm_dc@dc6-psr.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-75:
    - shard-glk:          [SKIP][70] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][71] ([i915#1366] / [i915#1958])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-glk7/igt@kms_color_chamelium@pipe-c-ctm-0-75.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-glk8/igt@kms_color_chamelium@pipe-c-ctm-0-75.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][72] ([i915#1319]) -> [TIMEOUT][73] ([i915#1319] / [i915#1635])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-apl7/igt@kms_content_protection@lic.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-apl2/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][74] ([i915#357]) -> [FAIL][75] ([i915#357] / [i915#93] / [i915#95])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-kbl3/igt@kms_content_protection@uevent.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-kbl6/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][76] ([i915#357]) -> [FAIL][77] ([i915#357] / [i915#95])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-apl4/igt@kms_content_protection@uevent.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-apl1/igt@kms_content_protection@uevent.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-hsw:          [SKIP][78] ([fdo#109271] / [i915#1927]) -> [SKIP][79] ([fdo#109271])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-hsw2/igt@kms_plane_lowres@pipe-b-tiling-yf.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-hsw2/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][80] ([fdo#109642] / [fdo#111068]) -> [FAIL][81] ([i915#608])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8553/shard-iclb7/igt@kms_psr2_su@page_flip.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/shard-iclb2/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1078]: https://gitlab.freedesktop.org/drm/intel/issues/1078
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1366]: https://gitlab.freedesktop.org/drm/intel/issues/1366
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1959]: https://gitlab.freedesktop.org/drm/intel/issues/1959
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5683 -> IGTPW_4624
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8553: 9f1b8b4fcb466dc714b1f825fd93e3bbd29c7de6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4624: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/index.html
  IGT_5683: 757b6e72d546fd2dbc3801a73796d67b0854021b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4624/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
