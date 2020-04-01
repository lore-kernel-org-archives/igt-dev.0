Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Apr 2020 18:17:08 -0000
Message-ID: <158576502822.25626.17376256982841565684@emeril.freedesktop.org>
References: <20200331123857.1212432-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200331123857.1212432-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
 =?utf-8?q?ium_and_TypeC?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Chamelium and TypeC
URL   : https://patchwork.freedesktop.org/series/75319/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8230_full -> IGTPW_4383_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4383_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4383_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4383_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-tglb:         [PASS][1] -> [SKIP][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-tglb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-tglb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_vblank@invalid:
    - shard-snb:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-snb2/igt@kms_vblank@invalid.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-snb4/igt@kms_vblank@invalid.html
    - shard-hsw:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-hsw2/igt@kms_vblank@invalid.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-hsw1/igt@kms_vblank@invalid.html

  
#### Warnings ####

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][7] ([fdo#109349]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8230_full and IGTPW_4383_full:

### New IGT tests (5) ###

  * igt@gem_exec_capture@capture:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_chamelium@dp-hpd-enable-disable-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium@dp-hpd-with-enabled-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - Statuses : 14 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
    - Statuses : 14 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4383_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#110854])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109276]) +11 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl2/igt@gem_workarounds@suspend-resume-context.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#716])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-glk7/igt@gen9_exec_parse@allowed-all.html
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#716])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl7/igt@gen9_exec_parse@allowed-all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#454])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#1316])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-tglb6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +5 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#52] / [i915#54]) +6 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#177] / [i915#52] / [i915#54])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#52] / [i915#54] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180] / [i915#93] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#899])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@invalid:
    - shard-kbl:          [PASS][45] -> [FAIL][46] ([i915#1375])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl7/igt@kms_vblank@invalid.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl4/igt@kms_vblank@invalid.html
    - shard-apl:          [PASS][47] -> [FAIL][48] ([i915#1375])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl2/igt@kms_vblank@invalid.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-apl8/igt@kms_vblank@invalid.html
    - shard-iclb:         [PASS][49] -> [FAIL][50] ([i915#1375])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb2/igt@kms_vblank@invalid.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb1/igt@kms_vblank@invalid.html
    - shard-glk:          [PASS][51] -> [FAIL][52] ([i915#1375])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk4/igt@kms_vblank@invalid.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-glk4/igt@kms_vblank@invalid.html
    - shard-tglb:         [PASS][53] -> [FAIL][54] ([i915#1375])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-tglb6/igt@kms_vblank@invalid.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-tglb6/igt@kms_vblank@invalid.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#112080]) +10 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb1/igt@perf_pmu@busy-vcs1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb7/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][57] ([fdo#112080]) -> [PASS][58] +9 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb8/igt@gem_busy@busy-vcs1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][59] ([fdo#109276] / [i915#677]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb3/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@implicit-write-read-bsd:
    - shard-iclb:         [SKIP][61] ([i915#677]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb3/igt@gem_exec_schedule@implicit-write-read-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][63] ([fdo#112146]) -> [PASS][64] +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl7/igt@gem_softpin@noreloc-s3.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl1/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][67] ([i915#454]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-apl:          [FAIL][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl1/igt@i915_pm_rc6_residency@rc6-idle.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-apl8/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-glk:          [FAIL][71] ([i915#1527]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk5/igt@i915_pm_rc6_residency@rc6-idle.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-glk4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_concurrent@pipe-b:
    - shard-hsw:          [FAIL][73] ([i915#1539]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-hsw2/igt@kms_concurrent@pipe-b.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-hsw1/igt@kms_concurrent@pipe-b.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [FAIL][75] ([i915#54]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
    - shard-kbl:          [FAIL][77] ([i915#54]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
    - shard-glk:          [FAIL][79] ([i915#54]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [FAIL][81] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][83] ([i915#52] / [i915#54]) -> [PASS][84] +4 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-kbl:          [FAIL][85] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][87] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][89] ([i915#79]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk9/igt@kms_flip@flip-vs-expired-vblank.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-glk9/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-apl:          [DMESG-WARN][91] ([i915#1297]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl6/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-apl8/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][93] ([i915#180]) -> [PASS][94] +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-kbl:          [DMESG-WARN][95] ([i915#180]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-glk:          [FAIL][97] -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk4/igt@kms_flip@plain-flip-fb-recreate.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-glk8/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [FAIL][99] ([i915#95]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [FAIL][101] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][103] ([i915#93] / [i915#95]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl2/igt@kms_mmap_write_crc@main.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl3/igt@kms_mmap_write_crc@main.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][105] ([fdo#109441]) -> [PASS][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-tglb:         [SKIP][107] ([fdo#112015]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-tglb7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-hsw:          [SKIP][109] ([fdo#109271]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-hsw7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-hsw8/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][111] ([fdo#109278]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-glk:          [SKIP][113] ([fdo#109271]) -> [PASS][114] +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-glk7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-apl:          [SKIP][115] ([fdo#109271]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl4/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-apl2/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-iclb:         [SKIP][117] -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb4/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb7/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-kbl:          [SKIP][119] ([fdo#109271]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl2/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][121] ([fdo#109276]) -> [PASS][122] +19 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][123] ([fdo#108145] / [i915#95]) -> [FAIL][124] ([fdo#108145])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][125] ([fdo#108145]) -> [FAIL][126] ([fdo#108145] / [i915#93] / [i915#95])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-apl:          [FAIL][127] ([fdo#108145]) -> [FAIL][128] ([fdo#108145] / [i915#95])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglb:         [SKIP][129] -> [SKIP][130] ([fdo#109289])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-tglb8/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-tglb6/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][131] ([i915#1423] / [i915#92]) -> ([FAIL][132], [FAIL][133]) ([i915#1423] / [i915#716] / [i915#92])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl2/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl2/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/shard-kbl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1375]: https://gitlab.freedesktop.org/drm/intel/issues/1375
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1527]: https://gitlab.freedesktop.org/drm/intel/issues/1527
  [i915#1539]: https://gitlab.freedesktop.org/drm/intel/issues/1539
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5550 -> IGTPW_4383
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8230: fa9f8453ffb88a4fc4e36d68b84a7ff9bf90f769 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4383: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/index.html
  IGT_5550: 98927dfde17aecaecfe67bb9853ceca326ca2b23 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4383/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
