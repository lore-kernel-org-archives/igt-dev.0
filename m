Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 02 Apr 2020 13:00:57 -0000
Message-ID: <158583245790.24293.1259420620315527157@emeril.freedesktop.org>
References: <20200331123857.1212432-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200331123857.1212432-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
 =?utf-8?q?ium_and_TypeC_=28rev2=29?=
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

Series: Chamelium and TypeC (rev2)
URL   : https://patchwork.freedesktop.org/series/75319/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5554_full -> IGTPW_4392_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4392_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4392_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4392_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-tglb8/igt@gem_exec_whisper@basic-fds-priority-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-tglb1/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-tglb:         [PASS][3] -> [SKIP][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-tglb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-tglb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_vblank@invalid:
    - shard-snb:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-snb5/igt@kms_vblank@invalid.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-snb2/igt@kms_vblank@invalid.html
    - shard-hsw:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-hsw4/igt@kms_vblank@invalid.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-hsw8/igt@kms_vblank@invalid.html

  
#### Warnings ####

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][9] ([fdo#109349]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@perf@gen12-oa-tlb-invalidate}:
    - shard-tglb:         [PASS][11] -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-tglb3/igt@perf@gen12-oa-tlb-invalidate.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-tglb1/igt@perf@gen12-oa-tlb-invalidate.html
    - shard-iclb:         [SKIP][13] ([fdo#109289]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-iclb3/igt@perf@gen12-oa-tlb-invalidate.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-iclb8/igt@perf@gen12-oa-tlb-invalidate.html

  
New tests
---------

  New tests have been introduced between IGT_5554_full and IGTPW_4392_full:

### New IGT tests (15) ###

  * igt@gem_busy@busy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_busy@extended:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_busy@parallel:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@basic-spin:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@fifo:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@implicit-boths:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@implicit-read-write:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@implicit-write-read:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@independent:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_store@dword:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_hangman@error-state-capture:
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

  Here are the changes found in IGTPW_4392_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#54]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-hsw8/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-snb:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-snb6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-snb6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +7 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#72])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#52] / [i915#54]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-apl1/igt@kms_flip@flip-vs-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-apl8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][35] -> [FAIL][36] ([i915#31])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-hsw8/igt@kms_setmode@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-hsw1/igt@kms_setmode@basic.html

  * igt@kms_vblank@invalid:
    - shard-iclb:         [PASS][37] -> [FAIL][38] ([i915#1375])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-iclb7/igt@kms_vblank@invalid.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-iclb6/igt@kms_vblank@invalid.html
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#1375])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-glk3/igt@kms_vblank@invalid.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-glk9/igt@kms_vblank@invalid.html
    - shard-tglb:         [PASS][41] -> [FAIL][42] ([i915#1375])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-tglb7/igt@kms_vblank@invalid.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-tglb6/igt@kms_vblank@invalid.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#112080]) +7 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109276])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][47] ([i915#1277]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-tglb6/igt@gem_exec_balancer@hang.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-tglb3/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][49] ([fdo#110854]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][51] ([i915#454]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [WARN][53] ([i915#1519]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [SKIP][55] ([i915#1316] / [i915#579]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-tglb7/igt@i915_pm_rpm@i2c.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-tglb6/igt@i915_pm_rpm@i2c.html
    - shard-hsw:          [SKIP][57] ([fdo#109271]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-hsw4/igt@i915_pm_rpm@i2c.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-hsw7/igt@i915_pm_rpm@i2c.html
    - shard-iclb:         [SKIP][59] ([i915#1316]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-iclb7/igt@i915_pm_rpm@i2c.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-iclb7/igt@i915_pm_rpm@i2c.html

  * igt@kms_concurrent@pipe-b:
    - shard-hsw:          [FAIL][61] ([i915#1539]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-hsw8/igt@kms_concurrent@pipe-b.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-hsw2/igt@kms_concurrent@pipe-b.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [FAIL][63] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding:
    - shard-snb:          [SKIP][65] ([fdo#109271]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-snb1/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-snb1/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [FAIL][67] ([i915#52] / [i915#54]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][69] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][71] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][73] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][75] ([i915#1525]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][77] ([i915#64]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [FAIL][79] ([i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [FAIL][81] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-kbl:          [FAIL][83] ([i915#49]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
    - shard-apl:          [FAIL][85] ([i915#49]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][87] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][91] ([fdo#112015]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-tglb7/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-iclb:         [SKIP][93] ([fdo#109278]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-iclb7/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-iclb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][95] ([i915#180]) -> [PASS][96] +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-glk:          [SKIP][97] ([fdo#109271]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-glk3/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-glk1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  * igt@perf_pmu@init-sema-vcs1:
    - shard-iclb:         [SKIP][99] ([fdo#112080]) -> [PASS][100] +4 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-iclb7/igt@perf_pmu@init-sema-vcs1.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-iclb2/igt@perf_pmu@init-sema-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][101] ([fdo#109276]) -> [PASS][102] +3 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-iclb5/igt@prime_busy@hang-bsd2.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-iclb2/igt@prime_busy@hang-bsd2.html

  * {igt@sysfs_timeslice_duration@timeout@vecs0}:
    - shard-glk:          [FAIL][103] ([i915#1459]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-glk8/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-glk6/igt@sysfs_timeslice_duration@timeout@vecs0.html
    - shard-kbl:          [FAIL][105] ([i915#1459]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-kbl4/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-kbl2/igt@sysfs_timeslice_duration@timeout@vecs0.html
    - shard-tglb:         [FAIL][107] -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/shard-tglb3/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/shard-tglb1/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1375]: https://gitlab.freedesktop.org/drm/intel/issues/1375
  [i915#1459]: https://gitlab.freedesktop.org/drm/intel/issues/1459
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1539]: https://gitlab.freedesktop.org/drm/intel/issues/1539
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5554 -> IGTPW_4392

  CI-20190529: 20190529
  CI_DRM_8233: 0862243a5514a9da625520bd4f554f8348077594 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4392: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/index.html
  IGT_5554: f3ba9eca8b0a1c0074bd43b0ee5dbebe833f5f09 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
