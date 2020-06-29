Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 29 Jun 2020 20:28:58 -0000
Message-ID: <159346253866.745.15845745731837611080@emeril.freedesktop.org>
References: <20200629171614.3254-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20200629171614.3254-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fcreate=3A_Added_test_description_for_test_case?=
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
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_create: Added test description for test case
URL   : https://patchwork.freedesktop.org/series/78906/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8673_full -> IGTPW_4713_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/index.html

Known issues
------------

  Here are the changes found in IGTPW_4713_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2] ([i915#118] / [i915#95]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-glk7/igt@gem_ctx_shared@q-smoketest-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-glk3/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_vm_create@invalid-destroy:
    - shard-tglb:         [PASS][3] -> [DMESG-WARN][4] ([i915#402]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-tglb5/igt@gem_vm_create@invalid-destroy.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-tglb8/igt@gem_vm_create@invalid-destroy.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#93] / [i915#95]) +38 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl1/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-kbl2/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-apl:          [PASS][7] -> [DMESG-FAIL][8] ([i915#1635] / [i915#54] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#1525])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-tglb:         [PASS][13] -> [DMESG-WARN][14] ([i915#1982]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1635] / [i915#95]) +27 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][17] -> [DMESG-FAIL][18] ([i915#95]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-c-primary-size-128:
    - shard-hsw:          [PASS][19] -> [TIMEOUT][20] ([i915#1958])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-hsw4/igt@kms_plane_cursor@pipe-c-primary-size-128.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-hsw1/igt@kms_plane_cursor@pipe-c-primary-size-128.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [PASS][21] -> [DMESG-FAIL][22] ([i915#1635] / [i915#95]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl2/igt@kms_prime@basic-crc@second-to-first.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl7/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#1820])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][27] ([i915#1930]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-glk4/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-snb:          [TIMEOUT][29] ([i915#1958]) -> [PASS][30] +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-snb4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-snb4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][31] ([i915#1436] / [i915#716]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl6/igt@gen9_exec_parse@allowed-all.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_getparams_basic@basic-eu-total:
    - shard-kbl:          [DMESG-WARN][33] ([i915#93] / [i915#95]) -> [PASS][34] +43 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl7/igt@i915_getparams_basic@basic-eu-total.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-kbl3/igt@i915_getparams_basic@basic-eu-total.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][35] ([i915#402]) -> [PASS][36] +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-tglb3/igt@i915_module_load@reload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-tglb7/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-apl:          [DMESG-WARN][37] ([i915#1635] / [i915#95]) -> [PASS][38] +25 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl2/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rps@waitboost:
    - shard-glk:          [FAIL][39] ([i915#39]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-glk9/igt@i915_pm_rps@waitboost.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-glk9/igt@i915_pm_rps@waitboost.html

  * igt@kms_atomic_interruptible@legacy-dpms:
    - shard-hsw:          [INCOMPLETE][41] ([i915#2055]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-hsw8/igt@kms_atomic_interruptible@legacy-dpms.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-hsw8/igt@kms_atomic_interruptible@legacy-dpms.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][43] ([i915#1982]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][45] ([i915#54] / [i915#95]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][47] ([i915#96]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +11 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][51] ([i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl4/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-kbl2/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-tglb:         [DMESG-WARN][53] ([i915#1982]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_lease@lessee_list:
    - shard-hsw:          [TIMEOUT][55] ([i915#1958]) -> [PASS][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-hsw6/igt@kms_lease@lessee_list.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-hsw6/igt@kms_lease@lessee_list.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][57] ([fdo#108145] / [i915#95]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [DMESG-FAIL][59] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [DMESG-FAIL][61] ([i915#95]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [DMESG-FAIL][63] ([i915#1635] / [i915#95]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@blocking:
    - shard-glk:          [DMESG-WARN][67] ([i915#118] / [i915#95]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-glk7/igt@perf@blocking.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-glk8/igt@perf@blocking.html

  * igt@perf_pmu@most-busy-idle-check-all@vecs0:
    - shard-iclb:         [DMESG-WARN][69] ([i915#1982]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-iclb2/igt@perf_pmu@most-busy-idle-check-all@vecs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-iclb2/igt@perf_pmu@most-busy-idle-check-all@vecs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-kbl:          [INCOMPLETE][71] ([i915#1958]) -> [INCOMPLETE][72] ([i915#1958] / [i915#95])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl7/igt@gem_exec_reloc@basic-concurrent16.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-kbl6/igt@gem_exec_reloc@basic-concurrent16.html
    - shard-apl:          [INCOMPLETE][73] ([i915#1635] / [i915#1958]) -> [INCOMPLETE][74] ([i915#1635] / [i915#1958] / [i915#95])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl4/igt@gem_exec_reloc@basic-concurrent16.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl1/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_schedule@submit-golden-slice:
    - shard-hsw:          [SKIP][75] ([fdo#109271]) -> [TIMEOUT][76] ([i915#1958]) +4 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-hsw6/igt@gem_exec_schedule@submit-golden-slice.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-hsw1/igt@gem_exec_schedule@submit-golden-slice.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-apl:          [SKIP][77] ([fdo#109271]) -> [SKIP][78] ([fdo#109271] / [i915#1635]) +9 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl8/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl1/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][79] ([i915#1515]) -> [WARN][80] ([i915#1515])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_color@pipe-d-ctm-0-75:
    - shard-snb:          [SKIP][81] ([fdo#109271]) -> [TIMEOUT][82] ([i915#1958]) +5 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-snb1/igt@kms_color@pipe-d-ctm-0-75.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-snb1/igt@kms_color@pipe-d-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-apl:          [SKIP][83] ([fdo#109271] / [fdo#111827]) -> [SKIP][84] ([fdo#109271] / [fdo#111827] / [i915#1635]) +3 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl8/igt@kms_color_chamelium@pipe-d-ctm-max.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][85] ([i915#93] / [i915#95]) -> [DMESG-WARN][86] ([i915#180])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][87] ([i915#1226]) -> [SKIP][88] ([fdo#109349])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-snb:          [TIMEOUT][89] ([i915#1958]) -> [SKIP][90] ([fdo#109271]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-snb4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-snb4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
    - shard-hsw:          [TIMEOUT][91] ([i915#1958]) -> [SKIP][92] ([fdo#109271])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-hsw6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-hsw7/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][93] ([i915#180]) -> [FAIL][94] ([i915#64])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-apl:          [SKIP][95] ([fdo#109271] / [i915#1635]) -> [SKIP][96] ([fdo#109271]) +11 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][97] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][98] ([fdo#108145] / [i915#95]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-apl:          [FAIL][99] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][100] ([fdo#108145] / [i915#1635] / [i915#95]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@perf@polling-parameterized:
    - shard-apl:          [FAIL][101] ([i915#1542]) -> [DMESG-FAIL][102] ([i915#1635] / [i915#95])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl8/igt@perf@polling-parameterized.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl1/igt@perf@polling-parameterized.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106], [FAIL][107]) ([fdo#109271] / [i915#1610] / [i915#1635] / [i915#637] / [i915#716]) -> [FAIL][108] ([i915#1635])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl4/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl3/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl7/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl6/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/shard-apl6/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/shard-apl2/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#637]: https://gitlab.freedesktop.org/drm/intel/issues/637
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5718 -> IGTPW_4713
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8673: ae0a2b45fe022c02a2779c2ae8c83473763c1feb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4713: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/index.html
  IGT_5718: af1ef32bfae90bcdbaf1b5d84c61ff4e04368505 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4713/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
