Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8879439904629262069=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Tue, 05 Dec 2023 03:08:43 -0000
Message-ID: <170174572380.24283.2811818812374454450@emeril.freedesktop.org>
References: <20231204194306.12950-1-brian.welty@intel.com>
In-Reply-To: <20231204194306.12950-1-brian.welty@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRml4IHhl?=
 =?utf-8?q?=5Fexec=5Freset=40cm-gt-reset_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============8879439904629262069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix xe_exec_reset@cm-gt-reset (rev2)
URL   : https://patchwork.freedesktop.org/series/127211/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13973_full -> IGTPW_10333_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10333_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10333_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/index.html

Participating hosts (12 -> 10)
------------------------------

  Missing    (2): shard-rkl0 shard-tglu0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10333_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-5/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-19/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live@requests:
    - shard-mtlp:         [PASS][4] -> [DMESG-FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-mtlp-5/igt@i915_selftest@live@requests.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-5/igt@i915_selftest@live@requests.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-rkl:          [PASS][6] -> [SKIP][7] +23 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_color@ctm-green-to-red@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][8] +45 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_color@ctm-green-to-red@pipe-b.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          [SKIP][9] ([i915#1769] / [i915#3555]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][11] ([i915#5286]) -> [SKIP][12] +4 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-rkl:          [SKIP][13] ([fdo#111614] / [i915#3638]) -> [SKIP][14] +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglu:         [SKIP][15] ([fdo#111614]) -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-tglu-5/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-3/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-rkl:          [SKIP][17] ([fdo#111615]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-rkl:          [SKIP][19] ([fdo#110723]) -> [SKIP][20] +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_content_protection@lic:
    - shard-rkl:          [SKIP][21] ([i915#7118]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_content_protection@lic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-rkl:          [SKIP][23] ([fdo#109279] / [i915#3359]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          [SKIP][25] ([i915#3359]) -> [SKIP][26] +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][27] ([fdo#111825]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          [SKIP][29] ([i915#3555] / [i915#3840]) -> [SKIP][30] +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_dsc@dsc-with-bpc-formats.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          [SKIP][31] ([i915#3555] / [i915#8228]) -> [SKIP][32] +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-2/igt@kms_hdr@invalid-metadata-sizes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-rkl:          [SKIP][33] ([i915#5289]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][35] ([fdo#111615] / [i915#5289]) -> [SKIP][36] +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-rkl:          [SKIP][37] ([i915#3555]) -> [SKIP][38] +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-none.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_scaling_modes@scaling-mode-none.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_ccs@pipe-a-bad-aux-stride-4-tiled-mtl-rc-ccs-cc}:
    - shard-rkl:          NOTRUN -> [SKIP][39] +12 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_ccs@pipe-a-bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * {igt@kms_ccs@pipe-a-missing-ccs-buffer-4-tiled-mtl-mc-ccs}:
    - shard-rkl:          [SKIP][40] ([i915#5354] / [i915#6095]) -> [SKIP][41] +21 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_ccs@pipe-a-missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_ccs@pipe-a-missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * {igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-gen12-rc-ccs-cc}:
    - shard-rkl:          [PASS][42] -> [SKIP][43] +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-2/igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * {igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc}:
    - shard-rkl:          [SKIP][44] ([i915#5354]) -> [SKIP][45] +33 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-4/igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * {igt@kms_content_protection@content-type-change}:
    - shard-rkl:          [SKIP][46] ([i915#9424]) -> [SKIP][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_content_protection@content-type-change.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_content_protection@content-type-change.html

  * {igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3}:
    - shard-dg2:          NOTRUN -> [SKIP][48]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3.html

  
Known issues
------------

  Here are the changes found in IGTPW_10333_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#9318])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-7/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#8414]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-12/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@isolation@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#8414]) +10 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@drm_fdinfo@isolation@bcs0.html

  * igt@drm_fdinfo@isolation@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#8414]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@drm_fdinfo@isolation@rcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [PASS][53] -> [FAIL][54] ([i915#7742])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@fbdev@pan:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#2582])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@fbdev@pan.html

  * igt@gem_bad_reloc@negative-reloc:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3281]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-12/igt@gem_bad_reloc@negative-reloc.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#7697])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-4/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][58] -> [INCOMPLETE][59] ([i915#7297])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#7697]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@gem_close_race@multigpu-basic-threads.html
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#7697])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-15/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#8555])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#1099])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-snb7/igt@gem_ctx_persistence@process.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4812])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4812])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-7/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4036])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-5/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_capture@many-4k-incremental:
    - shard-rkl:          NOTRUN -> [FAIL][67] ([i915#9606])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-2/igt@gem_exec_capture@many-4k-incremental.html

  * igt@gem_exec_fair@basic-none:
    - shard-snb:          NOTRUN -> [SKIP][68] ([fdo#109271]) +60 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-snb2/igt@gem_exec_fair@basic-none.html
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3539] / [i915#4852])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-19/igt@gem_exec_fair@basic-none.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglu:         [PASS][70] -> [FAIL][71] ([i915#2842])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-tglu-9/igt@gem_exec_fair@basic-none-share@rcs0.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-7/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-glk:          [PASS][72] -> [FAIL][73] ([i915#2842])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-glk4/igt@gem_exec_fair@basic-none-share@rcs0.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3539] / [i915#4852]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-3/igt@gem_exec_fair@basic-none-vip.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          [PASS][75] -> [FAIL][76] ([i915#2842])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][77] ([i915#2842]) +3 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk8/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4812])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-18/igt@gem_exec_fence@submit.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#7697])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#3281]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-wc-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#3281]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@gem_exec_reloc@basic-wc-cpu.html
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#3281]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@gem_exec_reloc@basic-wc-cpu.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4565])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#4613]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#4613]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-glk:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#4613]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk7/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#4613]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-8/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4083]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-12/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@big-bo-tiledy:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#4077]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-7/igt@gem_mmap_gtt@big-bo-tiledy.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4077]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-12/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4077]) +10 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4083]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#4083]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-7/igt@gem_mmap_wc@read-write.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-rkl:          [PASS][94] -> [SKIP][95] ([i915#1850])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#3282]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@gem_partial_pwrite_pread@reads-uncached.html
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#3282])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@gem_partial_pwrite_pread@reads-uncached.html
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#3282]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#4270]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#4270]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-3/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#4270]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-9/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#4270]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-2/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#3282])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-17/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#8428]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#8411])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_spin_batch@spin-all-new:
    - shard-dg2:          NOTRUN -> [FAIL][106] ([i915#5889])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@gem_spin_batch@spin-all-new.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#4079])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-5/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([fdo#110542])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#3297])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-4/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#3297]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#3297]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-16/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#3297])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([fdo#109289])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#2527]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@gen9_exec_parse@bb-oversize.html
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#2527] / [i915#2856]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-6/igt@gen9_exec_parse@bb-oversize.html
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#2856]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#2856]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#2527])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-13/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_module_load@load:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#6227])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          [PASS][120] -> [INCOMPLETE][121] ([i915#9200])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-glk6/igt@i915_module_load@reload-with-fault-injection.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk9/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#8399])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-4/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][123] ([i915#9407])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rps@thresholds-park@gt0:
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#8925])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@i915_pm_rps@thresholds-park@gt0.html

  * igt@i915_pm_rps@thresholds-park@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#3555] / [i915#8925])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@i915_pm_rps@thresholds-park@gt1.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([fdo#109303])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-10/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([fdo#109302])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-4/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][128] ([i915#9311])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-13/igt@i915_selftest@mock@memory_region.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#4212])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [FAIL][130] ([i915#8247]) +3 other tests fail
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#9531])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#5286]) +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
    - shard-tglu:         NOTRUN -> [SKIP][133] ([fdo#111615] / [i915#5286]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([fdo#111614]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#4538] / [i915#5286])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][136] -> [FAIL][137] ([i915#5138])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         NOTRUN -> [FAIL][138] ([i915#5138])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#3638]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-17/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([fdo#111614]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([fdo#111614] / [i915#3638])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
    - shard-tglu:         NOTRUN -> [SKIP][142] ([fdo#111614])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         [PASS][143] -> [FAIL][144] ([i915#3743]) +1 other test fail
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-tglu-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#5190]) +9 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#6187])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#4538] / [i915#5190]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([fdo#110723]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([fdo#111615]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([fdo#111615]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#4538]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#7213]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#4087]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#4087]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][155] ([fdo#111827])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-6/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([fdo#111827])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([fdo#111827]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#7828]) +7 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#7828]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#7828])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#7828]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-8/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#7828]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#3299]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#6944] / [i915#7116] / [i915#7118])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][165] ([i915#7173])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#7116])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-16/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#7118])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#3359]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#3359]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#3359])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#3359])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#3555]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#3546]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#4103] / [i915#4213] / [i915#5608])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#4103])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#4213])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([fdo#109274] / [i915#5354]) +5 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([fdo#111767] / [fdo#111825]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][179] -> [FAIL][180] ([i915#2346])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#4103] / [i915#4213])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#4103] / [i915#4213])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-15/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#8588])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#3804])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#8812])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#3555] / [i915#3840])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#3555] / [i915#3840])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#3469])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_fbcon_fbt@psr.html
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#3955])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_fbcon_fbt@psr.html
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#3469])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([fdo#109274] / [i915#3637] / [i915#3966])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-9/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#3637]) +4 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-snb:          NOTRUN -> [SKIP][193] ([fdo#109271] / [fdo#111767])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-snb5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#8381])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#8381]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-15/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([fdo#109274]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([fdo#109274] / [i915#3637]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-3/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([fdo#111825]) +5 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#3637]) +11 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#2672])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#2587] / [i915#2672])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#2672]) +3 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#2587] / [i915#2672]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#3555] / [i915#8810]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#2672]) +3 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#5274])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#8708]) +14 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([fdo#111825]) +9 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:
    - shard-rkl:          [PASS][209] -> [SKIP][210] ([i915#1849] / [i915#5354]) +6 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#3458]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#1825]) +12 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#8708]) +3 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#5354]) +26 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#8708]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][216] ([fdo#109271]) +150 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#5460])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([fdo#110189]) +6 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#3458]) +15 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#1849] / [i915#5354]) +9 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([fdo#111825] / [i915#1825]) +13 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([fdo#109280]) +17 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#3023]) +7 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#6118])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#3555] / [i915#8228])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-16/igt@kms_hdr@static-swap.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#4816])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#4070] / [i915#4816])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#1839])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#6301])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#6301])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html
    - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#6301])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-9/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([fdo#109289]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-16/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([fdo#109289])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#8825])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#3555] / [i915#8821])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@kms_plane_lowres@tiling-yf.html
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#3555]) +13 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([fdo#109274]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#6953])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#5176] / [i915#9423]) +3 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#6953] / [i915#8152])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#5235]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#5235]) +19 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#5235]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#3555] / [i915#5235]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#8152]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#5235]) +11 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#5235]) +8 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#3555] / [i915#6953] / [i915#8152]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#6524] / [i915#6805])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#6524])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#6524])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-10/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#6524]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-2/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([fdo#111068] / [i915#9683]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-13/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#9683])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#9683])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#9683]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#4348]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#9673])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#9673])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#9673] / [i915#9732]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-16/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#9673] / [i915#9732])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-10/igt@kms_psr@psr2_sprite_render.html
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#9673] / [i915#9732])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#5289])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#5289])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#4235] / [i915#5190])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-rkl:          NOTRUN -> [SKIP][266] ([fdo#111615] / [i915#5289])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#3555]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-9/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][268] ([i915#5465]) +1 other test fail
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#8623])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([fdo#109289]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@perf@per-context-mode-unprivileged.html
    - shard-dg1:          NOTRUN -> [SKIP][271] ([fdo#109289] / [i915#2433])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-12/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [PASS][272] -> [FAIL][273] ([i915#4349])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-mtlp-7/igt@perf_pmu@busy-double-start@rcs0.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][274] ([i915#4349]) +3 other tests fail
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([fdo#112283]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#8516])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-2/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@v3d/v3d_mmap@mmap-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#2575]) +5 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-5/igt@v3d/v3d_mmap@mmap-bo.html

  * igt@v3d/v3d_perfmon@create-perfmon-invalid-counters:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#2575]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-18/igt@v3d/v3d_perfmon@create-perfmon-invalid-counters.html

  * igt@v3d/v3d_perfmon@get-values-invalid-pointer:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([fdo#109315] / [i915#2575]) +5 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-9/igt@v3d/v3d_perfmon@get-values-invalid-pointer.html

  * igt@v3d/v3d_submit_csd@valid-multisync-submission:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([fdo#109315]) +5 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@v3d/v3d_submit_csd@valid-multisync-submission.html

  * igt@v3d/v3d_wait_bo@unused-bo-0ns:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#2575]) +11 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@v3d/v3d_wait_bo@unused-bo-0ns.html

  * igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#7711]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#2575]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-2/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html

  * igt@vc4/vc4_tiling@get-after-free:
    - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#7711]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-4/igt@vc4/vc4_tiling@get-after-free.html

  * igt@vc4/vc4_tiling@set-bad-handle:
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#7711]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-15/igt@vc4/vc4_tiling@set-bad-handle.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#7711]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@virtual-idle:
    - shard-rkl:          [FAIL][287] ([i915#7742]) -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@drm_fdinfo@virtual-idle.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@drm_fdinfo@virtual-idle.html

  * igt@fbdev@eof:
    - shard-rkl:          [SKIP][289] ([i915#2582]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@fbdev@eof.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@fbdev@eof.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglu:         [FAIL][291] ([i915#6268]) -> [PASS][292]
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-9/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][293] ([i915#5784]) -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg2-5/igt@gem_eio@kms.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@gem_eio@kms.html

  * igt@gem_eio@wait-1us:
    - shard-mtlp:         [ABORT][295] ([i915#9262]) -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-mtlp-4/igt@gem_eio@wait-1us.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@gem_eio@wait-1us.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [FAIL][297] ([i915#2846]) -> [PASS][298]
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][299] ([i915#2842]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-tglu:         [FAIL][301] ([i915#2842]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-rkl:          [FAIL][303] ([i915#2842]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-2/igt@gem_exec_fair@basic-pace@vcs0.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [INCOMPLETE][305] -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [INCOMPLETE][307] ([i915#9200]) -> [PASS][308]
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [INCOMPLETE][309] ([i915#9200]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-8/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [ABORT][311] -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [INCOMPLETE][313] ([i915#7790]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-snb4/igt@i915_pm_rps@reset.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-snb2/igt@i915_pm_rps@reset.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         [FAIL][315] ([i915#3743]) -> [PASS][316] +1 other test pass
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-tglu-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_color@degamma@pipe-a:
    - shard-rkl:          [SKIP][317] -> [PASS][318] +22 other tests pass
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_color@degamma@pipe-a.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_color@degamma@pipe-a.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][319] ([i915#2346]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-rkl:          [SKIP][321] ([i915#1849]) -> [PASS][322] +3 other tests pass
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_fbcon_fbt@fbc.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a2:
    - shard-glk:          [INCOMPLETE][323] -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a2.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][325] ([i915#1849] / [i915#5354]) -> [PASS][326] +8 other tests pass
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-dg2:          [FAIL][327] ([i915#6880]) -> [PASS][328] +1 other test pass
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * {igt@kms_pm_rpm@i2c}:
    - shard-rkl:          [SKIP][329] ([fdo#109308]) -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_pm_rpm@i2c.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_pm_rpm@i2c.html

  * {igt@kms_pm_rpm@modeset-non-lpsp-stress}:
    - shard-dg2:          [SKIP][331] ([i915#9519]) -> [PASS][332] +1 other test pass
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1:
    - shard-snb:          [FAIL][333] ([i915#9196]) -> [PASS][334]
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][335] ([i915#9196]) -> [PASS][336]
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-mtlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  
#### Warnings ####

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [INCOMPLETE][337] ([i915#5566]) -> [ABORT][338] ([i915#5566])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-glk9/igt@gen9_exec_parse@allowed-single.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk1/igt@gen9_exec_parse@allowed-single.html

  * igt@kms_async_flips@crc@pipe-b-edp-1:
    - shard-mtlp:         [DMESG-FAIL][339] ([i915#8561]) -> [FAIL][340] ([i915#8247])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-mtlp-1/igt@kms_async_flips@crc@pipe-b-edp-1.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@kms_async_flips@crc@pipe-b-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          [SKIP][341] -> [SKIP][342] ([i915#1769] / [i915#3555])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          [SKIP][343] -> [SKIP][344] ([i915#5286]) +4 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_big_fb@4-tiled-addfb.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          [SKIP][345] -> [SKIP][346] ([fdo#111614] / [i915#3638]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          [SKIP][347] -> [SKIP][348] ([fdo#110723]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          [SKIP][349] -> [SKIP][350] ([i915#3116])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-0.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][351] -> [SKIP][352] ([i915#7118])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_content_protection@srm.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          [SKIP][353] -> [SKIP][354] ([fdo#109279] / [i915#3359])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-rkl:          [SKIP][355] -> [SKIP][356] ([fdo#111767] / [fdo#111825])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-rkl:          [SKIP][357] -> [SKIP][358] ([fdo#111825])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          [SKIP][359] -> [SKIP][360] ([i915#4103]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          [SKIP][361] -> [SKIP][362] ([i915#3555] / [i915#3840])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_dsc@dsc-basic.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][363] ([i915#3955]) -> [SKIP][364] ([fdo#110189] / [i915#3955])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-rkl:          [SKIP][365] ([i915#1849] / [i915#5354]) -> [SKIP][366] ([fdo#111825] / [i915#1825]) +26 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][367] ([i915#1849] / [i915#5354]) -> [SKIP][368] ([fdo#111825]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-rkl:          [SKIP][369] ([fdo#111825] / [i915#1825]) -> [SKIP][370] ([i915#1849] / [i915#5354]) +35 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          [SKIP][371] ([i915#3023]) -> [SKIP][372] ([i915#1849] / [i915#5354]) +27 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          [SKIP][373] ([i915#1849] / [i915#5354]) -> [SKIP][374] ([i915#5439])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][375] ([i915#1849] / [i915#5354]) -> [SKIP][376] ([i915#3023]) +17 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [SKIP][377] -> [SKIP][378] ([i915#3555] / [i915#8228]) +2 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_hdr@static-toggle.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_hdr@static-toggle.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-rkl:          [SKIP][379] ([fdo#111825]) -> [SKIP][380] ([fdo#111825] / [i915#8152])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_psr@psr2_basic:
    - shard-dg2:          [SKIP][381] ([i915#9673] / [i915#9732]) -> [SKIP][382] ([i915#9673] / [i915#9736])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg2-1/igt@kms_psr@psr2_basic.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_dpms:
    - shard-rkl:          [SKIP][383] ([i915#9673]) -> [SKIP][384] ([i915#9673] / [i915#9732]) +3 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_psr@psr2_dpms.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-dg2:          [SKIP][385] ([i915#9673] / [i915#9736]) -> [SKIP][386] ([i915#9673] / [i915#9732]) +2 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg2-11/igt@kms_psr@psr2_primary_blt.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_psr@psr2_primary_blt.html
    - shard-rkl:          [SKIP][387] ([i915#9673] / [i915#9732]) -> [SKIP][388] ([i915#9673]) +2 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-4/igt@kms_psr@psr2_primary_blt.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          [SKIP][389] -> [SKIP][390] ([i915#3555]) +2 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_vrr@flip-basic.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@kms_vrr@flip-basic.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          [INCOMPLETE][391] ([i915#5493]) -> [CRASH][392] ([i915#9351])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg2-1/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5460]: https://gitlab.freedesktop.org/drm/intel/issues/5460
  [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5889]: https://gitlab.freedesktop.org/drm/intel/issues/5889
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6118]: https://gitlab.freedesktop.org/drm/intel/issues/6118
  [i915#6187]: https://gitlab.freedesktop.org/drm/intel/issues/6187
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
  [i915#7297]: https://gitlab.freedesktop.org/drm/intel/issues/7297
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7790]: https://gitlab.freedesktop.org/drm/intel/issues/7790
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/intel/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/intel/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8561]: https://gitlab.freedesktop.org/drm/intel/issues/8561
  [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
  [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
  [i915#8810]: https://gitlab.freedesktop.org/drm/intel/issues/8810
  [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
  [i915#8821]: https://gitlab.freedesktop.org/drm/intel/issues/8821
  [i915#8825]: https://gitlab.freedesktop.org/drm/intel/issues/8825
  [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
  [i915#9053]: https://gitlab.freedesktop.org/drm/intel/issues/9053
  [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
  [i915#9200]: https://gitlab.freedesktop.org/drm/intel/issues/9200
  [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262
  [i915#9311]: https://gitlab.freedesktop.org/drm/intel/issues/9311
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9337]: https://gitlab.freedesktop.org/drm/intel/issues/9337
  [i915#9340]: https://gitlab.freedesktop.org/drm/intel/issues/9340
  [i915#9351]: https://gitlab.freedesktop.org/drm/intel/issues/9351
  [i915#9407]: https://gitlab.freedesktop.org/drm/intel/issues/9407
  [i915#9412]: https://gitlab.freedesktop.org/drm/intel/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/intel/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/intel/issues/9433
  [i915#9519]: https://gitlab.freedesktop.org/drm/intel/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/intel/issues/9531
  [i915#9606]: https://gitlab.freedesktop.org/drm/intel/issues/9606
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9683]: https://gitlab.freedesktop.org/drm/intel/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/intel/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9736]: https://gitlab.freedesktop.org/drm/intel/issues/9736


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7618 -> IGTPW_10333
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_13973: d5d9afd7c699fef7d84d8d04961d2f7f12c34e45 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10333: 10333
  IGT_7618: 222d1bdf8c598bb12164deab127af5d8d7ddc070 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/index.html

--===============8879439904629262069==
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
<tr><td><b>Series:</b></td><td>Fix xe_exec_reset@cm-gt-reset (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127211/">https://patchwork.freedesktop.org/series/127211/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13973_full -&gt; IGTPW_10333_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10333_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10333_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/index.html</p>
<h2>Participating hosts (12 -&gt; 10)</h2>
<p>Missing    (2): shard-rkl0 shard-tglu0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10333_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-5/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-19/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-mtlp-5/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-5/igt@i915_selftest@live@requests.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_color@ctm-green-to-red@pipe-b.html">SKIP</a> +45 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-tglu-5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-3/igt@kms_big_fb@linear-8bpp-rotate-270.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_content_protection@lic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_content_protection@lic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-2/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_ccs@pipe-a-bad-aux-stride-4-tiled-mtl-rc-ccs-cc}:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_ccs@pipe-a-bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-a-missing-ccs-buffer-4-tiled-mtl-mc-ccs}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_ccs@pipe-a-missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_ccs@pipe-a-missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> +21 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-gen12-rc-ccs-cc}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-2/igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-4/igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@content-type-change}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_content_protection@content-type-change.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3}:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10333_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-7/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-12/igt@drm_fdinfo@busy-hang@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@drm_fdinfo@isolation@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@drm_fdinfo@isolation@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-12/igt@gem_bad_reloc@negative-reloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-4/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7297">i915#7297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +1 other test skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-15/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-snb7/igt@gem_ctx_persistence@process.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-7/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-5/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-incremental:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-2/igt@gem_exec_capture@many-4k-incremental.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9606">i915#9606</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-snb2/igt@gem_exec_fair@basic-none.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +60 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-19/igt@gem_exec_fair@basic-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-tglu-9/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-glk4/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-3/igt@gem_exec_fair@basic-none-vip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk8/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-18/igt@gem_exec_fence@submit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +5 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +5 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 other test skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk7/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-8/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-object:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-12/igt@gem_mmap@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-bo-tiledy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-7/igt@gem_mmap_gtt@big-bo-tiledy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-12/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@gem_mmap_wc@bad-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-7/igt@gem_mmap_wc@read-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1850">i915#1850</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +3 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@gem_pxp@create-regular-context-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-3/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-9/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-2/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-17/igt@gem_readwrite@read-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-all-new:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@gem_spin_batch@spin-all-new.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5889">i915#5889</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-5/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110542">fdo#110542</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-4/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 other test skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-16/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +1 other test skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-6/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +2 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-13/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6227">i915#6227</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-glk6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk9/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9200">i915#9200</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-4/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9407">i915#9407</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park@gt0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@i915_pm_rps@thresholds-park@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8925">i915#8925</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@i915_pm_rps@thresholds-park@gt1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8925">i915#8925</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-10/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109303">fdo#109303</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-4/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109302">fdo#109302</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-13/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9311">i915#9311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +3 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-17/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-tglu-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-6/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-8/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@kms_content_protection@legacy@pipe-a-dp-4.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-16/igt@kms_content_protection@lic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +2 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-15/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8588">i915#8588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3469">i915#3469</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3469">i915#3469</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-9/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3966">i915#3966</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-snb5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>)</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-15/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-3/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8810">i915#8810</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +150 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5460">i915#5460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6118">i915#6118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-16/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-9/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-16/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8821">i915#8821</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +13 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8152">i915#8152</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8152">i915#8152</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6805">i915#6805</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-10/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-2/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-13/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4348">i915#4348</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-16/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-10/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-9/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5465">i915#5465</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +3 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-12/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2433">i915#2433</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-mtlp-7/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-1/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-2/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_mmap@mmap-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-5/igt@v3d/v3d_mmap@mmap-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@create-perfmon-invalid-counters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-18/igt@v3d/v3d_perfmon@create-perfmon-invalid-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-invalid-pointer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-9/igt@v3d/v3d_perfmon@get-values-invalid-pointer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@valid-multisync-submission:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@v3d/v3d_submit_csd@valid-multisync-submission.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@unused-bo-0ns:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-2/igt@v3d/v3d_wait_bo@unused-bo-0ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +3 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-2/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-after-free:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-4/igt@vc4/vc4_tiling@get-after-free.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@set-bad-handle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg1-15/igt@vc4/vc4_tiling@set-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-1ns:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@drm_fdinfo@virtual-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@drm_fdinfo@virtual-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-9/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg2-5/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-10/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@wait-1us:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-mtlp-4/igt@gem_eio@wait-1us.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@gem_eio@wait-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-2/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9200">i915#9200</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9200">i915#9200</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-8/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-snb4/igt@i915_pm_rps@reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7790">i915#7790</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-snb2/igt@i915_pm_rps@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-tglu-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-tglu-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_color@degamma@pipe-a.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_color@degamma@pipe-a.html">PASS</a> +22 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-2/igt@kms_fbcon_fbt@fbc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a2.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@i2c}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109308">fdo#109308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@modeset-non-lpsp-stress}:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-mtlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-glk9/igt@gen9_exec_parse@allowed-single.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-glk1/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-mtlp-1/igt@kms_async_flips@crc@pipe-b-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8561">i915#8561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-mtlp-1/igt@kms_async_flips@crc@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_content_protection@srm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_hdr@static-toggle.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-5/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg2-1/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-11/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9736">i915#9736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-4/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg2-11/igt@kms_psr@psr2_primary_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9736">i915#9736</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-6/igt@kms_psr@psr2_primary_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +2 other tests skip</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-4/igt@kms_psr@psr2_primary_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-1/igt@kms_psr@psr2_primary_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-rkl-1/igt@kms_vrr@flip-basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-rkl-7/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13973/shard-dg2-1/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10333/shard-dg2-7/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9351">i915#9351</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7618 -&gt; IGTPW_10333</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13973: d5d9afd7c699fef7d84d8d04961d2f7f12c34e45 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10333: 10333<br />
  IGT_7618: 222d1bdf8c598bb12164deab127af5d8d7ddc070 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============8879439904629262069==--
