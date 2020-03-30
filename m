Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 30 Mar 2020 07:37:25 -0000
Message-ID: <158555384589.13827.13511398993156579361@emeril.freedesktop.org>
References: <20200327140844.11430-1-mika.kahola@intel.com>
In-Reply-To: <20200327140844.11430-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fconcurrent=3A_Move_bandwidth_calculation_to_igt=5Ffixture?=
 =?utf-8?q?_=28rev2=29?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_concurrent: Move bandwidth calculation to igt_fixture (rev2)
URL   : https://patchwork.freedesktop.org/series/75174/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8211_full -> IGTPW_4369_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4369_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4369_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4369_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl2/igt@i915_suspend@forcewake.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl1/igt@i915_suspend@forcewake.html

  * igt@kms_concurrent@pipe-c:
    - shard-hsw:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-hsw7/igt@kms_concurrent@pipe-c.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-hsw2/igt@kms_concurrent@pipe-c.html

  
#### Warnings ####

  * igt@kms_concurrent@pipe-b:
    - shard-hsw:          [FAIL][5] ([i915#1539]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-hsw2/igt@kms_concurrent@pipe-b.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-hsw2/igt@kms_concurrent@pipe-b.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-iclb5/igt@perf@blocking-parameterized.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-iclb1/igt@perf@blocking-parameterized.html
    - shard-hsw:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-hsw7/igt@perf@blocking-parameterized.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-hsw6/igt@perf@blocking-parameterized.html

  
Known issues
------------

  Here are the changes found in IGTPW_4369_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#110854])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-iclb8/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +15 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-iclb4/igt@gem_exec_schedule@out-order-bsd2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#677])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112146]) +7 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#1527])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-glk8/igt@i915_pm_rc6_residency@rc6-idle.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-glk1/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-hsw:          [PASS][21] -> [TIMEOUT][22] ([i915#1526])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-hsw7/igt@i915_pm_rc6_residency@rc6-idle.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-hsw7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-hsw:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-hsw7/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-hsw8/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([i915#1316]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-iclb3/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-iclb3/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#1316]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-tglb8/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-tglb1/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-glk:          [PASS][29] -> [SKIP][30] ([fdo#109271]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-glk2/igt@i915_pm_rpm@drm-resources-equal.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-glk3/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#54])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-apl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#180] / [i915#54])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#52] / [i915#54]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#1525] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#64] / [i915#93] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#31])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-apl7/igt@kms_setmode@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-apl8/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#112080]) +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@engines-mixed-process@vcs0:
    - shard-apl:          [FAIL][49] ([i915#1517] / [i915#1528]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-apl2/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-apl8/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][51] ([fdo#109276] / [i915#677]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][53] ([i915#677]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#112146]) -> [PASS][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][57] ([fdo#109276]) -> [PASS][58] +13 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-apl1/igt@gem_workarounds@suspend-resume-context.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-apl3/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][61] ([i915#716]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-glk7/igt@gen9_exec_parse@allowed-all.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [INCOMPLETE][63] ([i915#1390]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-tglb6/igt@i915_module_load@reload-with-fault-injection.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-tglb1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-glk:          [INCOMPLETE][65] ([i915#1390] / [i915#58] / [k.org#198133]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-glk5/igt@i915_module_load@reload-with-fault-injection.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-glk3/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [INCOMPLETE][67] ([i915#82]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html
    - shard-iclb:         [INCOMPLETE][69] ([i915#1390] / [i915#140]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-iclb7/igt@i915_module_load@reload-with-fault-injection.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-iclb3/igt@i915_module_load@reload-with-fault-injection.html
    - shard-hsw:          [INCOMPLETE][71] ([i915#61]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-hsw6/igt@i915_module_load@reload-with-fault-injection.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-hsw8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [INCOMPLETE][73] ([i915#656]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-apl7/igt@i915_selftest@live@execlists.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-apl6/igt@i915_selftest@live@execlists.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][75] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-glk:          [FAIL][77] ([i915#52] / [i915#54]) -> [PASS][78] +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][79] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][81] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][83] ([i915#79]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-kbl:          [DMESG-WARN][85] ([i915#1297]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl4/igt@kms_flip@flip-vs-fences.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl4/igt@kms_flip@flip-vs-fences.html
    - shard-apl:          [DMESG-WARN][87] ([i915#1297]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-apl6/igt@kms_flip@flip-vs-fences.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-apl6/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [FAIL][89] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [FAIL][91] ([i915#95]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][93] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][95] ([i915#93] / [i915#95]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl6/igt@kms_mmap_write_crc@main.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl2/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [FAIL][97] ([fdo#108145] / [i915#93] / [i915#95]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [FAIL][99] ([fdo#108145] / [i915#95]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][101] ([i915#899]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][103] ([fdo#109441]) -> [PASS][104] +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-iclb6/igt@kms_psr@psr2_cursor_render.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][105] ([i915#180]) -> [PASS][106] +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * {igt@perf@polling-parameterized}:
    - shard-tglb:         [FAIL][107] -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-tglb1/igt@perf@polling-parameterized.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-tglb2/igt@perf@polling-parameterized.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][109] ([fdo#112080]) -> [PASS][110] +9 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-iclb8/igt@perf_pmu@busy-check-all-vcs1.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-iclb4/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-kbl:          [INCOMPLETE][111] ([i915#1390] / [i915#879]) -> [INCOMPLETE][112] ([i915#1423] / [i915#879])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl3/igt@i915_module_load@reload-with-fault-injection.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl6/igt@i915_module_load@reload-with-fault-injection.html
    - shard-apl:          [INCOMPLETE][113] ([i915#1390]) -> [INCOMPLETE][114] ([i915#1423])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-apl3/igt@i915_module_load@reload-with-fault-injection.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-apl4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][115] ([i915#454]) -> [SKIP][116] ([i915#468])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][117] ([i915#180]) -> [DMESG-WARN][118] ([i915#180] / [i915#93] / [i915#95])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-kbl:          [FAIL][119] ([fdo#108145] / [i915#93] / [i915#95]) -> [FAIL][120] ([fdo#108145])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparant-fb:
    - shard-kbl:          [FAIL][121] ([fdo#108145]) -> [FAIL][122] ([fdo#108145] / [i915#93] / [i915#95])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparant-fb.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparant-fb.html
    - shard-apl:          [FAIL][123] ([fdo#108145]) -> [FAIL][124] ([fdo#108145] / [i915#95])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparant-fb.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparant-fb.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][125] ([i915#1423] / [i915#1485] / [i915#92]) -> [FAIL][126] ([i915#1423] / [i915#92])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-kbl3/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-kbl6/igt@runner@aborted.html
    - shard-apl:          ([FAIL][127], [FAIL][128]) ([i915#1423] / [i915#1485] / [i915#529]) -> [FAIL][129] ([i915#1423])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-apl3/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8211/shard-apl7/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/shard-apl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1390]: https://gitlab.freedesktop.org/drm/intel/issues/1390
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#1517]: https://gitlab.freedesktop.org/drm/intel/issues/1517
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1526]: https://gitlab.freedesktop.org/drm/intel/issues/1526
  [i915#1527]: https://gitlab.freedesktop.org/drm/intel/issues/1527
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1539]: https://gitlab.freedesktop.org/drm/intel/issues/1539
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5544 -> IGTPW_4369
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8211: 459cb5ae1e2c64d2a6777f1c9a667550ed0bf8b8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4369: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/index.html
  IGT_5544: 477c562fc9932939083d732b77dd7b083c6bc0a1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4369/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
