Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2722126648399798215=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 04 Dec 2023 22:44:30 -0000
Message-ID: <170172987076.20592.14744354481470439979@emeril.freedesktop.org>
References: <c4d830023b60b1bc2c09d1383230afabe445248e.1701693214.git.mchehab@kernel.org>
In-Reply-To: <c4d830023b60b1bc2c09d1383230afabe445248e.1701693214.git.mchehab@kernel.org>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2NyaXB0?=
 =?utf-8?q?s/test=5Flist=2Epy=3A_better_identify_planned_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2722126648399798215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: scripts/test_list.py: better identify planned tests
URL   : https://patchwork.freedesktop.org/series/127294/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13972_full -> IGTPW_10331_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10331_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10331_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/index.html

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): shard-mtlp0 shard-rkl0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10331_full:

### IGT changes ###

#### Possible regressions ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-snb6/igt@dmabuf@all-tests@dma_fence_chain.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-snb6/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_color@degamma@pipe-a:
    - shard-rkl:          [PASS][5] -> [SKIP][6] +28 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_color@degamma@pipe-a.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_color@degamma@pipe-a.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][7] +42 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_draw_crc@draw-method-mmap-gtt.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          [SKIP][8] ([i915#5286]) -> [SKIP][9] +4 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          [SKIP][10] ([fdo#111614] / [i915#3638]) -> [SKIP][11] +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-3/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-rkl:          [SKIP][12] ([fdo#111615]) -> [SKIP][13] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][14] ([fdo#110723]) -> [SKIP][15] +5 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          [SKIP][16] ([i915#3116]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          [SKIP][18] ([i915#7118]) -> [SKIP][19] +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_content_protection@legacy.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-rkl:          [SKIP][20] ([fdo#111767] / [fdo#111825]) -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-rkl:          [SKIP][22] ([fdo#111825]) -> [SKIP][23] +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          [SKIP][24] ([i915#3555] / [i915#3840]) -> [SKIP][25] +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          [SKIP][26] ([i915#3555] / [i915#8228]) -> [SKIP][27] +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-4/igt@kms_hdr@static-toggle-dpms.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          [SKIP][28] ([i915#3555]) -> [SKIP][29] +7 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-5/igt@kms_plane_lowres@tiling-yf.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][30] ([fdo#111615] / [i915#5289]) -> [SKIP][31] +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_ccs@pipe-a-bad-aux-stride-4-tiled-mtl-rc-ccs-cc}:
    - shard-rkl:          [SKIP][32] ([i915#5354] / [i915#6095]) -> [SKIP][33] +27 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-3/igt@kms_ccs@pipe-a-bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_ccs@pipe-a-bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * {igt@kms_ccs@pipe-a-bad-aux-stride-y-tiled-gen12-rc-ccs-cc}:
    - shard-rkl:          NOTRUN -> [SKIP][34] +10 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_ccs@pipe-a-bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * {igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc}:
    - shard-rkl:          [PASS][35] -> [SKIP][36] +9 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * {igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc}:
    - shard-rkl:          [SKIP][37] ([i915#5354]) -> [SKIP][38] +30 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-4/igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * {igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4}:
    - shard-dg2:          NOTRUN -> [SKIP][39]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html

  * {igt@kms_dsc@dsc-fractional-bpp-with-bpc}:
    - shard-rkl:          [SKIP][40] ([i915#3840]) -> [SKIP][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  
Known issues
------------

  Here are the changes found in IGTPW_10331_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#7701])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg2:          [PASS][43] -> [INCOMPLETE][44] ([i915#5507])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg2-6/igt@device_reset@unbind-reset-rebind.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@isolation@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#8414]) +11 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-7/igt@drm_fdinfo@isolation@rcs0.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#8414]) +9 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#8414]) +21 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@fbdev@pan:
    - shard-rkl:          [PASS][48] -> [SKIP][49] ([i915#2582]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-4/igt@fbdev@pan.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@fbdev@pan.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3281]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-17/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#3555])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#9323])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#7697])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#7697])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-7/igt@gem_close_race@multigpu-basic-threads.html
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#7697])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-8/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#8555])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#5882]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#280])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@gem_ctx_sseu@mmap-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#280])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-5/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          [PASS][60] -> [ABORT][61] ([i915#7975] / [i915#8213])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg2-11/igt@gem_eio@hibernate.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][62] -> [FAIL][63] ([i915#5784])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg1-13/igt@gem_eio@reset-stress.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-17/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4812]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@gem_exec_balancer@bonded-false-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4812])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4812]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#4525])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_fair@basic-none:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3539] / [i915#4852]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@gem_exec_fair@basic-none.html
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4473] / [i915#4771])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@gem_exec_fair@basic-none.html

  * igt@gem_exec_fair@basic-none-solo:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#4473])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@gem_exec_fair@basic-none-solo.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][71] ([i915#2842])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-glk2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-tglu:         NOTRUN -> [FAIL][72] ([i915#2842]) +4 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-2/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][73] ([i915#2842]) +2 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglu:         [PASS][74] -> [FAIL][75] ([i915#2876])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-tglu-4/igt@gem_exec_fair@basic-pace@rcs0.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-5/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([fdo#109313])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-tglu:         NOTRUN -> [SKIP][77] ([fdo#109313])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-10/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#3711])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#3539])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-17/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#3539] / [i915#4852]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#7697]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([fdo#112283]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#3281]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#3281]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-write-wc-active:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#3281]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@gem_exec_reloc@basic-write-wc-active.html

  * igt@gem_exec_schedule@deep@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4537])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@gem_exec_schedule@deep@rcs0.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4537] / [i915#4812])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-1/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4537] / [i915#4812])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          NOTRUN -> [ABORT][89] ([i915#7975] / [i915#8213])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4860]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-threaded-none.html
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#4860])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-5/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4860])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_lmem_swapping@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#4613]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-6/igt@gem_lmem_swapping@basic.html
    - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#4613])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-3/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4565]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#4613]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-3/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#3282]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_mmap@short-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#4083])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@gem_mmap@short-mmap.html
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#4083]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@gem_mmap@short-mmap.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#4077]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4077]) +11 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#4083]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-1/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-rkl:          [PASS][103] -> [SKIP][104] ([i915#1850])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#3282]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-3/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#3282]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads.html
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#3282]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#4270]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#4270]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#4270]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-9/igt@gem_pxp@fail-invalid-protected-context.html
    - shard-mtlp:         NOTRUN -> [SKIP][111] ([i915#4270]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-1/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#4270]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-15/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#8428]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-6/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#4079]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_spin_batch@spin-all-new:
    - shard-dg2:          NOTRUN -> [FAIL][115] ([i915#5889])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@gem_spin_batch@spin-all-new.html

  * igt@gem_tiled_pread_basic:
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#4079])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([fdo#110542])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-7/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#3297]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#3323])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#3297])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#3297])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#3297] / [i915#4958])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-1/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-dg2:          NOTRUN -> [FAIL][123] ([i915#3318])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_linear_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([fdo#109289])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@gen3_render_linear_blits.html

  * igt@gen3_render_tiledy_blits:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([fdo#109289])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-2/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#2527]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-17/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#2856]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@gen9_exec_parse@basic-rejected.html
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#2527]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-2/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#2856]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@load:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#6227])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-2/igt@i915_module_load@load.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][131] ([i915#9407])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#6590])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#6621])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][134] -> [FAIL][135] ([i915#8229])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-snb2/igt@i915_pm_rps@reset.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-snb1/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#4077]) +6 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#4212])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@kms_addfb_basic@basic-x-tiled-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4212])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-13/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#5286]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#5286])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb.html
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#5286])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#4538] / [i915#5286])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([fdo#111614]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-7/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([fdo#111614]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#3638]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-13/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-tglu:         NOTRUN -> [SKIP][146] ([fdo#111614])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#5190]) +11 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([fdo#111614] / [i915#3638]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([fdo#111615]) +5 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([fdo#110723])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#4538]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#4538] / [i915#5190]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([fdo#111615])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][154] ([fdo#111615]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#3742])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#4087]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-6/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#7828]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-7/igt@kms_chamelium_audio@dp-audio.html
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#7828]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([fdo#111827])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([fdo#111827])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-2/igt@kms_chamelium_color@ctm-limited-range.html
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([fdo#111827]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@kms_chamelium_color@ctm-limited-range.html
    - shard-rkl:          NOTRUN -> [SKIP][162] ([fdo#111827])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_chamelium_color@ctm-limited-range.html
    - shard-dg1:          NOTRUN -> [SKIP][163] ([fdo#111827])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#7828]) +7 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#7828]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#7828]) +6 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#6944])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][168] ([i915#7173])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#7118])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#7116])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#3359]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#3359])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#3359])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#3555] / [i915#8814])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#3555]) +3 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#3359])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#3546]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#4103])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#4103] / [i915#4213])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#4103]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#4213])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([fdo#109274] / [i915#5354]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([fdo#111825]) +5 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
    - shard-tglu:         NOTRUN -> [SKIP][184] ([fdo#109274]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#3804])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#8812])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#3555] / [i915#3840])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#4881]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-1/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][189] ([fdo#109274] / [i915#3637])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-9/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#8381])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([fdo#109274]) +4 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#3637])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#3637]) +4 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][194] ([i915#4423])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#2672])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#2587] / [i915#2672])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#3555]) +15 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#2672] / [i915#3555]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#2672]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#2672]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#3555] / [i915#8810])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#2672] / [i915#3555])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#8708]) +6 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#1849] / [i915#5354]) +6 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg1:          [PASS][205] -> [DMESG-WARN][206] ([i915#4423])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#8708]) +13 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [PASS][208] -> [SKIP][209] ([i915#1849] / [i915#5354]) +17 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([fdo#111825] / [i915#1825]) +12 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#8708]) +3 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#5439])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#3458]) +9 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][214] ([fdo#111825]) +26 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([fdo#110189]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#3458]) +15 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#5354]) +19 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([fdo#109280]) +5 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#1825]) +11 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#3023]) +8 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#3555] / [i915#8228]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#3555] / [i915#8228]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#6301])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([fdo#109289])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_plane@pixel-format:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#8825]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_plane@pixel-format.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#6953])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#5176] / [i915#9423]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#8152])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#5235]) +5 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#5235]) +11 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#3555] / [i915#5235]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#6953] / [i915#8152]) +4 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#5235]) +11 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-dp-4.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#5235]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#3555] / [i915#6953] / [i915#8152])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#6524])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_properties@crtc-properties-legacy:
    - shard-rkl:          [PASS][237] -> [SKIP][238] ([i915#1849])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-5/igt@kms_properties@crtc-properties-legacy.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#9683])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#9683])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([fdo#111068] / [i915#9683])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#9673] / [i915#9732])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_psr@psr2_cursor_plane_onoff.html
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#9673] / [i915#9732]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-15/igt@kms_psr@psr2_cursor_plane_onoff.html
    - shard-tglu:         NOTRUN -> [SKIP][244] ([i915#9673] / [i915#9732])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-6/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_dpms:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#9673] / [i915#9732]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-7/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#9673])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#4235]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#4884])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-13/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-rkl:          [PASS][249] -> [INCOMPLETE][250] ([i915#9569])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_rotation_crc@multiplane-rotation.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-2/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#5289]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([fdo#111615] / [i915#5289])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#4235]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([fdo#109309])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][255] -> [FAIL][256] ([i915#9196])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-glk1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-glk4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-tglu:         [PASS][257] -> [FAIL][258] ([i915#9196]) +1 other test fail
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@flip-basic:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#3555]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-13/igt@kms_vrr@flip-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#3555])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-10/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flipline:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#3555] / [i915#8808]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#2437])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#2437])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#7387])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-3/igt@perf@global-sseu-config-invalid.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         NOTRUN -> [FAIL][265] ([i915#4349])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-1/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-dg1:          NOTRUN -> [FAIL][266] ([i915#4349])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [PASS][267] -> [FAIL][268] ([i915#4349]) +3 other tests fail
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#5608] / [i915#8516])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#3708] / [i915#4077])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#3291] / [i915#3708])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([fdo#109295] / [i915#3708])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-3/igt@prime_vgem@fence-read-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#3708]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-17/igt@prime_vgem@fence-read-hang.html
    - shard-tglu:         NOTRUN -> [SKIP][274] ([fdo#109295])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-7/igt@prime_vgem@fence-read-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#3708])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@prime_vgem@fence-read-hang.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-dg2:          NOTRUN -> [FAIL][276] ([i915#9779])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@syncobj_wait@invalid-wait-zero-handles.html

  * igt@v3d/v3d_mmap@mmap-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#2575]) +5 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@v3d/v3d_mmap@mmap-bo.html

  * igt@v3d/v3d_submit_cl@bad-multisync-out-sync:
    - shard-tglu:         NOTRUN -> [SKIP][278] ([fdo#109315] / [i915#2575]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-9/igt@v3d/v3d_submit_cl@bad-multisync-out-sync.html

  * igt@v3d/v3d_submit_cl@valid-multisync-submission:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#2575]) +6 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@v3d/v3d_submit_cl@valid-multisync-submission.html

  * igt@v3d/v3d_submit_csd@bad-multisync-pad:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#2575]) +6 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@v3d/v3d_submit_csd@bad-multisync-pad.html

  * igt@v3d/v3d_submit_csd@bad-perfmon:
    - shard-snb:          NOTRUN -> [SKIP][281] ([fdo#109271]) +15 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-snb5/igt@v3d/v3d_submit_csd@bad-perfmon.html

  * igt@v3d/v3d_submit_csd@single-out-sync:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([fdo#109315]) +6 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-7/igt@v3d/v3d_submit_csd@single-out-sync.html

  * igt@vc4/vc4_lookup_fail@bad-color-write:
    - shard-glk:          NOTRUN -> [SKIP][283] ([fdo#109271]) +88 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-glk7/igt@vc4/vc4_lookup_fail@bad-color-write.html

  * igt@vc4/vc4_perfmon@create-perfmon-invalid-events:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#7711]) +3 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@vc4/vc4_perfmon@create-perfmon-invalid-events.html
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#2575])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-9/igt@vc4/vc4_perfmon@create-perfmon-invalid-events.html

  * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#7711]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-7/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html

  * igt@vc4/vc4_tiling@get-bad-handle:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#7711]) +5 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@vc4/vc4_tiling@get-bad-handle.html

  * igt@vc4/vc4_tiling@get-bad-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#7711]) +4 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-17/igt@vc4/vc4_tiling@get-bad-modifier.html

  
#### Possible fixes ####

  * igt@drm_read@empty-block:
    - shard-rkl:          [SKIP][289] -> [PASS][290] +18 other tests pass
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@drm_read@empty-block.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@drm_read@empty-block.html

  * igt@fbdev@write:
    - shard-rkl:          [SKIP][291] ([i915#2582]) -> [PASS][292]
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@fbdev@write.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@fbdev@write.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglu:         [FAIL][293] ([i915#6268]) -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-tglu-7/igt@gem_ctx_exec@basic-nohangcheck.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-5/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg1:          [ABORT][295] -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg1-17/igt@gem_ctx_persistence@hostile.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@gem_ctx_persistence@hostile.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][297] ([i915#2842]) -> [PASS][298]
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglu:         [FAIL][299] ([i915#2842]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-tglu-10/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-10/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-rkl:          [FAIL][301] ([i915#2842]) -> [PASS][302] +3 other tests pass
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-rkl:          [DMESG-WARN][303] -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@gem_exec_whisper@basic-fds-priority-all.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@gem_exec_whisper@basic-fds-priority-all.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0}:
    - shard-dg1:          [FAIL][305] ([i915#3591]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][307] ([i915#5138]) -> [PASS][308] +1 other test pass
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         [FAIL][309] ([i915#3743]) -> [PASS][310] +2 other tests pass
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_legacy@single-bo@all-pipes:
    - shard-mtlp:         [DMESG-WARN][311] ([i915#2017]) -> [PASS][312] +1 other test pass
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-mtlp-4/igt@kms_cursor_legacy@single-bo@all-pipes.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@kms_cursor_legacy@single-bo@all-pipes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][313] ([i915#1849] / [i915#5354]) -> [PASS][314] +8 other tests pass
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html

  * {igt@kms_plane@pixel-format-source-clamping@pipe-a}:
    - shard-glk:          [DMESG-FAIL][315] ([i915#118]) -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-glk9/igt@kms_plane@pixel-format-source-clamping@pipe-a.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-glk7/igt@kms_plane@pixel-format-source-clamping@pipe-a.html

  * {igt@kms_pm_rpm@modeset-lpsp-stress}:
    - shard-rkl:          [SKIP][317] ([i915#9519]) -> [PASS][318] +1 other test pass
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * {igt@kms_pm_rpm@pm-tiling}:
    - shard-rkl:          [SKIP][319] ([fdo#109308]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_pm_rpm@pm-tiling.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_pm_rpm@pm-tiling.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-rkl:          [SKIP][321] ([i915#1849]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_properties@plane-properties-atomic.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-2/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-mtlp:         [FAIL][323] ([i915#9196]) -> [PASS][324] +1 other test pass
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-4:
    - shard-dg1:          [FAIL][325] ([fdo#103375]) -> [PASS][326]
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg1-17/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-4.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-4.html

  * igt@perf_pmu@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][327] ([i915#4349]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@perf_pmu@most-busy-check-all@rcs0.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@perf_pmu@most-busy-check-all@rcs0.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-dg1:          [FAIL][329] ([i915#9593]) -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg1-12/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  
#### Warnings ####

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [TIMEOUT][331] ([i915#5493]) -> [DMESG-WARN][332] ([i915#4936] / [i915#5493])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          [SKIP][333] -> [SKIP][334] ([i915#1769] / [i915#3555]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][335] -> [SKIP][336] ([i915#5286]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-rkl:          [SKIP][337] -> [SKIP][338] ([fdo#111614] / [i915#3638]) +3 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          [SKIP][339] -> [SKIP][340] ([fdo#110723]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          [SKIP][341] -> [SKIP][342] ([i915#3555]) +4 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-rkl:          [SKIP][343] -> [SKIP][344] ([i915#3359])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          [SKIP][345] -> [SKIP][346] ([fdo#111825]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          [SKIP][347] -> [SKIP][348] ([i915#4103])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][349] ([fdo#110189] / [i915#3955]) -> [SKIP][350] ([i915#3955])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][351] ([fdo#111825]) -> [SKIP][352] ([i915#1849] / [i915#5354])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][353] ([fdo#111825] / [i915#1825]) -> [SKIP][354] ([i915#1849] / [i915#5354]) +37 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][355] ([i915#1849] / [i915#5354]) -> [SKIP][356] ([fdo#111825] / [i915#1825]) +22 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][357] ([i915#1849] / [i915#5354]) -> [SKIP][358] ([i915#3023]) +15 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          [SKIP][359] ([i915#3023]) -> [SKIP][360] ([i915#1849] / [i915#5354]) +26 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@static-swap:
    - shard-rkl:          [SKIP][361] -> [SKIP][362] ([i915#3555] / [i915#8228])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_hdr@static-swap.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@kms_hdr@static-swap.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][363] ([i915#4816]) -> [SKIP][364] ([i915#4070] / [i915#4816])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-rkl:          [SKIP][365] ([fdo#111825]) -> [SKIP][366] ([fdo#111825] / [i915#8152])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_psr@psr2_basic:
    - shard-dg2:          [SKIP][367] ([i915#9673] / [i915#9732]) -> [SKIP][368] ([i915#9673] / [i915#9736]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg2-10/igt@kms_psr@psr2_basic.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-rkl:          [SKIP][369] ([i915#9673]) -> [SKIP][370] ([i915#9673] / [i915#9732])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_primary_render:
    - shard-rkl:          [SKIP][371] ([i915#9673] / [i915#9732]) -> [SKIP][372] ([i915#9673]) +3 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-2/igt@kms_psr@psr2_primary_render.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_psr@psr2_primary_render.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
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
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2876]: https://gitlab.freedesktop.org/drm/intel/issues/2876
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3711]: https://gitlab.freedesktop.org/drm/intel/issues/3711
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
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
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5507]: https://gitlab.freedesktop.org/drm/intel/issues/5507
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5882]: https://gitlab.freedesktop.org/drm/intel/issues/5882
  [i915#5889]: https://gitlab.freedesktop.org/drm/intel/issues/5889
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8229]: https://gitlab.freedesktop.org/drm/intel/issues/8229
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
  [i915#8717]: https://gitlab.freedesktop.org/drm/intel/issues/8717
  [i915#8808]: https://gitlab.freedesktop.org/drm/intel/issues/8808
  [i915#8810]: https://gitlab.freedesktop.org/drm/intel/issues/8810
  [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
  [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
  [i915#8825]: https://gitlab.freedesktop.org/drm/intel/issues/8825
  [i915#9053]: https://gitlab.freedesktop.org/drm/intel/issues/9053
  [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
  [i915#9292]: https://gitlab.freedesktop.org/drm/intel/issues/9292
  [i915#9295]: https://gitlab.freedesktop.org/drm/intel/issues/9295
  [i915#9298]: https://gitlab.freedesktop.org/drm/intel/issues/9298
  [i915#9323]: https://gitlab.freedesktop.org/drm/intel/issues/9323
  [i915#9407]: https://gitlab.freedesktop.org/drm/intel/issues/9407
  [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/intel/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/intel/issues/9433
  [i915#9519]: https://gitlab.freedesktop.org/drm/intel/issues/9519
  [i915#9569]: https://gitlab.freedesktop.org/drm/intel/issues/9569
  [i915#9581]: https://gitlab.freedesktop.org/drm/intel/issues/9581
  [i915#9593]: https://gitlab.freedesktop.org/drm/intel/issues/9593
  [i915#9653]: https://gitlab.freedesktop.org/drm/intel/issues/9653
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9683]: https://gitlab.freedesktop.org/drm/intel/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/intel/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9736]: https://gitlab.freedesktop.org/drm/intel/issues/9736
  [i915#9766]: https://gitlab.freedesktop.org/drm/intel/issues/9766
  [i915#9779]: https://gitlab.freedesktop.org/drm/intel/issues/9779


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7617 -> IGTPW_10331
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_13972: f76a66aa209bc55aab7be48e804217e0540ea673 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10331: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/index.html
  IGT_7617: 15eebc01e498c61f96928fa7fa3a0d53bdead193 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/index.html

--===============2722126648399798215==
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
<tr><td><b>Series:</b></td><td>scripts/test_list.py: better identify planned tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127294/">https://patchwork.freedesktop.org/series/127294/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13972_full -&gt; IGTPW_10331_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10331_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10331_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/index.html</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): shard-mtlp0 shard-rkl0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10331_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-snb6/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-snb6/igt@dmabuf@all-tests@dma_fence_chain.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_color@degamma@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_color@degamma@pipe-a.html">SKIP</a> +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> +42 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-3/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_content_protection@legacy.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-4/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> +1 other test skip</li>
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
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-3/igt@kms_ccs@pipe-a-bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_ccs@pipe-a-bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> +27 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-a-bad-aux-stride-y-tiled-gen12-rc-ccs-cc}:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_ccs@pipe-a-bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-4/igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4}:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-fractional-bpp-with-bpc}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10331_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7701">i915#7701</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg2-6/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5507">i915#5507</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-7/igt@drm_fdinfo@isolation@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-4/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-17/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-1/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-7/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-8/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5882">i915#5882</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-5/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg2-11/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg1-13/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-17/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +1 other test skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@gem_exec_fair@basic-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +4 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@gem_exec_fair@basic-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@gem_exec_fair@basic-none-solo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-glk2/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-2/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-tglu-4/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-5/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2876">i915#2876</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109313">fdo#109313</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-10/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109313">fdo#109313</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3711">i915#3711</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-17/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@gem_exec_reloc@basic-cpu-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@gem_exec_reloc@basic-write-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@deep@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@gem_exec_schedule@deep@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-1/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +2 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-5/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-6/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 other test skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-3/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4565">i915#4565</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-3/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@short-mmap:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@gem_mmap@short-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@gem_mmap@short-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@gem_mmap_gtt@cpuset-medium-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@gem_mmap_gtt@zero-extend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-1/igt@gem_mmap_wc@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1850">i915#1850</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-3/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +2 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@gem_pxp@create-regular-context-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-9/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 other test skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-1/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-15/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-6/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-all-new:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@gem_spin_batch@spin-all-new.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5889">i915#5889</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-7/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110542">fdo#110542</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 other test skip</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3323">i915#3323</a>)</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-1/igt@gem_userptr_blits@sd-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-2/igt@gen3_render_tiledy_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-17/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-2/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-2/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6227">i915#6227</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9407">i915#9407</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6590">i915#6590</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-snb2/igt@i915_pm_rps@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-snb1/igt@i915_pm_rps@reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8229">i915#8229</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@i915_suspend@fence-restore-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-13/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-7/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-13/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +2 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>)</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-6/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-7/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 other test skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-2/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_content_protection@lic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +5 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-1/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4881">i915#4881</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-9/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8810">i915#8810</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +5 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +11 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-2/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_plane@pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8825">i915#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8152">i915#8152</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@kms_prime@basic-crc-vgem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-5/igt@kms_properties@crtc-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_properties@crtc-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>)</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-15/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +3 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-6/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-7/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-2/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>) +1 other test skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-13/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4884">i915#4884</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_rotation_crc@multiplane-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-2/igt@kms_rotation_crc@multiplane-rotation.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9569">i915#9569</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-glk1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-glk4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-13/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +3 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-10/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8808">i915#8808</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-3/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-1/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-10/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-3/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-17/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +1 other test skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-7/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-4/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9779">i915#9779</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_mmap@mmap-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@v3d/v3d_mmap@mmap-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-multisync-out-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-9/igt@v3d/v3d_submit_cl@bad-multisync-out-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@valid-multisync-submission:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@v3d/v3d_submit_cl@valid-multisync-submission.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-pad:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-18/igt@v3d/v3d_submit_csd@bad-multisync-pad.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-perfmon:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-snb5/igt@v3d/v3d_submit_csd@bad-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@single-out-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-7/igt@v3d/v3d_submit_csd@single-out-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_lookup_fail@bad-color-write:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-glk7/igt@vc4/vc4_lookup_fail@bad-color-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +88 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-perfmon-invalid-events:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@vc4/vc4_perfmon@create-perfmon-invalid-events.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +3 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-9/igt@vc4/vc4_perfmon@create-perfmon-invalid-events.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-7/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-handle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-6/igt@vc4/vc4_tiling@get-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-17/igt@vc4/vc4_tiling@get-bad-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@empty-block:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@drm_read@empty-block.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@drm_read@empty-block.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-tglu-7/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-5/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg1-17/igt@gem_ctx_persistence@hostile.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@gem_ctx_persistence@hostile.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-tglu-10/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-10/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@gem_exec_whisper@basic-fds-priority-all.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@gem_exec_whisper@basic-fds-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@all-pipes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-mtlp-4/igt@kms_cursor_legacy@single-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@kms_cursor_legacy@single-bo@all-pipes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-source-clamping@pipe-a}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-glk9/igt@kms_plane@pixel-format-source-clamping@pipe-a.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-glk7/igt@kms_plane@pixel-format-source-clamping@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@modeset-lpsp-stress}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@pm-tiling}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109308">fdo#109308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_pm_rpm@pm-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_properties@plane-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-2/igt@kms_properties@plane-properties-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg1-17/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-4.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-19/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@perf_pmu@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@perf_pmu@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg1-12/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9593">i915#9593</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4936">i915#4936</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_hdr@static-swap.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-4/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-dg2-10/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-dg2-11/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9736">i915#9736</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-1/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-5/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13972/shard-rkl-2/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/shard-rkl-1/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7617 -&gt; IGTPW_10331</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13972: f76a66aa209bc55aab7be48e804217e0540ea673 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10331: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10331/index.html<br />
  IGT_7617: 15eebc01e498c61f96928fa7fa3a0d53bdead193 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============2722126648399798215==--

