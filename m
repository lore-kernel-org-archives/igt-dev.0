Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3499205435658274643=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Fri, 30 Jun 2023 18:34:36 -0000
Message-ID: <168815007632.24874.15746446115226777525@emeril.freedesktop.org>
References: <20230630070053.21064-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20230630070053.21064-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?xe/xe=5Fexec=5Fstore=3A_Add_xe=5Fstore_test_to_check_store_dwor?=
 =?utf-8?q?d_functionality?=
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

--===============3499205435658274643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe/xe_exec_store: Add xe_store test to check store dword functionality
URL   : https://patchwork.freedesktop.org/series/120048/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13339_full -> IGTPW_9308_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9308_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9308_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9308_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         [SKIP][2] ([i915#8761]) -> [SKIP][3] +12 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  
Known issues
------------

  Here are the changes found in IGTPW_9308_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-mtlp:         NOTRUN -> [SKIP][4] ([i915#7701])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg2:          [PASS][5] -> [ABORT][6] ([i915#5507] / [i915#8260])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-5/igt@device_reset@unbind-reset-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html
    - shard-rkl:          [PASS][7] -> [ABORT][8] ([i915#5507])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-rkl-1/igt@device_reset@unbind-reset-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-7/igt@device_reset@unbind-reset-rebind.html
    - shard-tglu:         [PASS][9] -> [ABORT][10] ([i915#5507])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-tglu-7/igt@device_reset@unbind-reset-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-5/igt@device_reset@unbind-reset-rebind.html
    - shard-apl:          [PASS][11] -> [ABORT][12] ([i915#5507])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-apl7/igt@device_reset@unbind-reset-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-apl2/igt@device_reset@unbind-reset-rebind.html
    - shard-glk:          [PASS][13] -> [ABORT][14] ([i915#5507])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-glk8/igt@device_reset@unbind-reset-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-glk3/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@most-busy-idle-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#8414]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@drm_fdinfo@most-busy-idle-check-all@ccs0.html

  * igt@feature_discovery@chamelium:
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#4854])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-7/igt@feature_discovery@chamelium.html

  * igt@gem_bad_reloc@negative-reloc-bltcopy:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#3281])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-6/igt@gem_bad_reloc@negative-reloc-bltcopy.html
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#3281])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-2/igt@gem_bad_reloc@negative-reloc-bltcopy.html

  * igt@gem_create@create-clear@smem0:
    - shard-rkl:          [PASS][19] -> [ABORT][20] ([i915#7461])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-rkl-7/igt@gem_create@create-clear@smem0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-2/igt@gem_create@create-clear@smem0.html

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#1099])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-snb4/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8555])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#4525])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@pi@vcs0:
    - shard-mtlp:         [PASS][24] -> [FAIL][25] ([i915#4475])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-4/igt@gem_exec_capture@pi@vcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@gem_exec_capture@pi@vcs0.html

  * igt@gem_exec_fair@basic-none-solo:
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#4473])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@gem_exec_fair@basic-none-solo.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#2842])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-rkl:          [PASS][29] -> [FAIL][30] ([i915#2842]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#3281]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_schedule@deep@vcs0:
    - shard-mtlp:         [PASS][32] -> [FAIL][33] ([i915#8606])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-7/igt@gem_exec_schedule@deep@vcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@gem_exec_schedule@deep@vcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-mtlp:         [PASS][34] -> [TIMEOUT][35] ([i915#8628])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-mtlp:         [PASS][36] -> [FAIL][37] ([i915#6363])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-7/igt@gem_exec_whisper@basic-forked-all.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@gem_exec_whisper@basic-forked-all.html

  * igt@gem_exec_whisper@basic-queues:
    - shard-snb:          NOTRUN -> [SKIP][38] ([fdo#109271]) +62 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-snb4/igt@gem_exec_whisper@basic-queues.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#4860])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_swapping@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#4613]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-1/igt@gem_lmem_swapping@basic.html

  * igt@gem_mmap@bad-object:
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#4083])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-7/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@basic-write-read-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4077]) +5 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-2/igt@gem_mmap_gtt@basic-write-read-distinct.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4077]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-7/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#3282]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3282])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#3282])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4270]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-2/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#8428]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#5190])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-6/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html

  * igt@gem_userptr_blits@nohangcheck:
    - shard-mtlp:         [PASS][50] -> [FAIL][51] ([i915#7916])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-1/igt@gem_userptr_blits@nohangcheck.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@gem_userptr_blits@nohangcheck.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][52] -> [ABORT][53] ([i915#5566])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-apl2/igt@gen9_exec_parse@allowed-all.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#2856])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@gen9_exec_parse@bb-oversize.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [PASS][55] -> [ABORT][56] ([i915#4528] / [i915#8393])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-snb2/igt@i915_module_load@reload-no-display.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-snb4/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#5354] / [i915#7561])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-10/igt@i915_pm_backlight@basic-brightness.html
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#7561])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-2/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][59] -> [SKIP][60] ([fdo#109271])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-apl4/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#8399])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-4/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-dg2:          [PASS][62] -> [FAIL][63] ([i915#7747])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-3/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [PASS][64] -> [SKIP][65] ([i915#1397]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#1397])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-6/igt@i915_pm_rpm@modeset-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#1397])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][68] -> [SKIP][69] ([i915#1397])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-4/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@slpc:
    - shard-mtlp:         [PASS][70] -> [DMESG-WARN][71] ([i915#6367])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-3/igt@i915_selftest@live@slpc.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@i915_selftest@live@slpc.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4212])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@crc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][73] ([i915#8247]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@kms_async_flips@crc@pipe-b-edp-1.html

  * igt@kms_async_flips@crc@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][74] ([i915#8561]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@kms_async_flips@crc@pipe-d-edp-1.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#5286]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][76] -> [FAIL][77] ([i915#5138])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         [PASS][78] -> [FAIL][79] ([i915#3743]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([fdo#111615]) +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4538] / [i915#5190])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
    - shard-rkl:          NOTRUN -> [SKIP][82] ([fdo#110723])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#5354] / [i915#6095])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-1/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#3886] / [i915#6095]) +3 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#3689] / [i915#5354])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-5/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#3734] / [i915#5354] / [i915#6095])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-4/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#6095]) +8 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#5354]) +7 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-1/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#5354]) +4 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-2/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#4087]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_color@degamma:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([fdo#111827])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#7828]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-3/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#7828]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#7828]) +3 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@lic@pipe-a-dp-2:
    - shard-dg2:          NOTRUN -> [TIMEOUT][95] ([i915#7173]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@kms_content_protection@lic@pipe-a-dp-2.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#7118])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-10/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-mtlp:         [PASS][97] -> [FAIL][98] ([i915#8248])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([fdo#109274] / [i915#5354])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
    - shard-rkl:          NOTRUN -> [SKIP][100] ([fdo#111825]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#3546])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([fdo#111767] / [i915#3546]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][103] -> [FAIL][104] ([i915#2346]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [PASS][105] -> [FAIL][106] ([i915#2346]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-move@all-pipes:
    - shard-mtlp:         [PASS][107] -> [DMESG-WARN][108] ([i915#2017]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-8/igt@kms_cursor_legacy@single-move@all-pipes.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][109] ([fdo#109271])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-glk4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([fdo#109274]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][111] ([i915#8381])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-7/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#2587] / [i915#2672])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#2672])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2:          [PASS][114] -> [FAIL][115] ([i915#6880])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#3023]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#3458])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#8708]) +4 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([fdo#111825] / [i915#1825]) +7 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][120] ([fdo#110189])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#8708]) +3 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#1825]) +4 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#3555]) +2 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-6/igt@kms_hdr@bpc-switch-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#3555]) +2 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#6953] / [i915#8228])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([fdo#109289])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html
    - shard-rkl:          NOTRUN -> [SKIP][127] ([fdo#109289])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-4/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:
    - shard-dg2:          [PASS][128] -> [FAIL][129] ([fdo#103375]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#5176]) +3 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#5176]) +7 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#5235]) +15 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#4235])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_vblank@pipe-c-query-busy:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#4070] / [i915#6768])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@kms_vblank@pipe-c-query-busy.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#2437])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@enable-disable@0-rcs0:
    - shard-dg2:          [PASS][136] -> [FAIL][137] ([i915#8724])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-8/igt@perf@enable-disable@0-rcs0.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([fdo#109289])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-2/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-idle@vcs0:
    - shard-dg2:          [PASS][139] -> [FAIL][140] ([i915#4349]) +7 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-6/igt@perf_pmu@busy-idle@vcs0.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-1/igt@perf_pmu@busy-idle@vcs0.html
    - shard-mtlp:         [PASS][141] -> [FAIL][142] ([i915#4349]) +3 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-4/igt@perf_pmu@busy-idle@vcs0.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@perf_pmu@busy-idle@vcs0.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#3291] / [i915#3708])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-7/igt@prime_vgem@basic-fence-read.html
    - shard-rkl:          NOTRUN -> [SKIP][144] ([fdo#109295] / [i915#3291] / [i915#3708])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@prime_vgem@basic-fence-read.html

  * igt@v3d/v3d_perfmon@create-perfmon-exceed:
    - shard-tglu:         NOTRUN -> [SKIP][145] ([fdo#109315] / [i915#2575])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-10/igt@v3d/v3d_perfmon@create-perfmon-exceed.html

  * igt@v3d/v3d_submit_cl@bad-multisync-extension:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#2575])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-5/igt@v3d/v3d_submit_cl@bad-multisync-extension.html
    - shard-rkl:          NOTRUN -> [SKIP][147] ([fdo#109315])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-4/igt@v3d/v3d_submit_cl@bad-multisync-extension.html

  * igt@v3d/v3d_submit_csd@bad-multisync-extension:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#2575]) +2 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@v3d/v3d_submit_csd@bad-multisync-extension.html

  * igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#7711])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-7/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#7711])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-4/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html

  * igt@vc4/vc4_perfmon@create-perfmon-invalid-events:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#7711])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@vc4/vc4_perfmon@create-perfmon-invalid-events.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@saturated-hostile@vecs0:
    - shard-mtlp:         [FAIL][152] ([i915#7816]) -> [PASS][153] +2 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-7/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile@vecs0.html

  * igt@gem_exec_balancer@full-pulse:
    - shard-dg2:          [FAIL][154] ([i915#6032]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-11/igt@gem_exec_balancer@full-pulse.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-1/igt@gem_exec_balancer@full-pulse.html

  * igt@gem_exec_endless@dispatch@rcs0:
    - {shard-dg1}:        [TIMEOUT][156] ([i915#3778] / [i915#7392]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg1-19/igt@gem_exec_endless@dispatch@rcs0.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg1-15/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][158] ([i915#2846]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-glk9/igt@gem_exec_fair@basic-deadline.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-glk9/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][160] ([i915#2842]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_schedule@preemptive-hang@vcs0:
    - shard-mtlp:         [FAIL][162] ([i915#7327]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-8/igt@gem_exec_schedule@preemptive-hang@vcs0.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-1/igt@gem_exec_schedule@preemptive-hang@vcs0.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-mtlp:         [FAIL][164] ([i915#6363]) -> [PASS][165] +1 similar issue
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-4/igt@gem_exec_whisper@basic-forked.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@gem_exec_whisper@basic-forked.html

  * igt@i915_module_load@load:
    - {shard-dg1}:        [SKIP][166] ([i915#6227]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg1-19/igt@i915_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg1-15/igt@i915_module_load@load.html
    - shard-dg2:          [SKIP][168] ([i915#6227]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-10/igt@i915_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@i915_module_load@load.html

  * igt@i915_module_load@reload:
    - shard-snb:          [ABORT][170] ([i915#4528]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-snb2/igt@i915_module_load@reload.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-snb6/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][172] ([i915#7061]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][174] ([i915#3989] / [i915#454]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-4/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][176] ([i915#4281]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-tglu-6/igt@i915_pm_dc@dc9-dpms.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-4/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-mtlp:         [SKIP][178] ([fdo#109289] / [i915#8403]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-3/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
    - shard-glk:          [DMESG-WARN][180] ([i915#118]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-glk7/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-glk3/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - {shard-dg1}:        [FAIL][182] ([i915#3591]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - {shard-dg1}:        [SKIP][184] ([i915#1397]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg1-16/igt@i915_pm_rpm@dpms-lpsp.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][186] ([i915#1397]) -> [PASS][187] +2 similar issues
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-dg2:          [FAIL][188] ([fdo#103375]) -> [PASS][189] +1 similar issue
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-5/igt@i915_pm_rpm@system-suspend.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-7/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [FAIL][190] ([i915#5138]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         [FAIL][192] ([i915#3743]) -> [PASS][193] +2 similar issues
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@single-bo@all-pipes:
    - shard-mtlp:         [DMESG-WARN][194] ([i915#2017]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-4/igt@kms_cursor_legacy@single-bo@all-pipes.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@kms_cursor_legacy@single-bo@all-pipes.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-dg2:          [FAIL][196] ([i915#6880]) -> [PASS][197] +2 similar issues
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [SKIP][198] ([i915#433]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-tglu-3/igt@kms_hdmi_inject@inject-audio.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@perf_pmu@busy-double-start@ccs3:
    - shard-dg2:          [FAIL][200] ([i915#4349]) -> [PASS][201] +2 similar issues
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-11/igt@perf_pmu@busy-double-start@ccs3.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@perf_pmu@busy-double-start@ccs3.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - {shard-dg1}:        [FAIL][202] ([i915#4349]) -> [PASS][203] +1 similar issue
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg1-16/igt@perf_pmu@busy-double-start@vcs1.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg1-14/igt@perf_pmu@busy-double-start@vcs1.html

  * {igt@perf_pmu@rc6@runtime-pm-long-gt1}:
    - shard-mtlp:         [SKIP][204] ([i915#8537]) -> [PASS][205] +2 similar issues
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-2/igt@perf_pmu@rc6@runtime-pm-long-gt1.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@perf_pmu@rc6@runtime-pm-long-gt1.html

  * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
    - shard-mtlp:         [FAIL][206] ([i915#6015]) -> [PASS][207] +5 similar issues
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-2/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html

  * igt@sysfs_preempt_timeout@timeout@vecs0:
    - shard-mtlp:         [ABORT][208] ([i915#8521]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-5/igt@sysfs_preempt_timeout@timeout@vecs0.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@sysfs_preempt_timeout@timeout@vecs0.html

  
#### Warnings ####

  * igt@kms_content_protection@mei_interface:
    - shard-dg2:          [SKIP][210] ([i915#7118]) -> [SKIP][211] ([i915#7118] / [i915#7162])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-1/igt@kms_content_protection@mei_interface.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         [FAIL][212] ([i915#2346]) -> [DMESG-FAIL][213] ([i915#2017] / [i915#5954])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][214] ([fdo#110189] / [i915#3955]) -> [SKIP][215] ([i915#3955])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-rkl-1/igt@kms_fbcon_fbt@psr.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          [SKIP][216] ([fdo#109285] / [i915#4098]) -> [SKIP][217] ([fdo#109285])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-rkl-4/igt@kms_force_connector_basic@force-load-detect.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@kms_force_connector_basic@force-load-detect.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
  [i915#4475]: https://gitlab.freedesktop.org/drm/intel/issues/4475
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5507]: https://gitlab.freedesktop.org/drm/intel/issues/5507
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5954]: https://gitlab.freedesktop.org/drm/intel/issues/5954
  [i915#6015]: https://gitlab.freedesktop.org/drm/intel/issues/6015
  [i915#6032]: https://gitlab.freedesktop.org/drm/intel/issues/6032
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6363]: https://gitlab.freedesktop.org/drm/intel/issues/6363
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7061]: https://gitlab.freedesktop.org/drm/intel/issues/7061
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7327]: https://gitlab.freedesktop.org/drm/intel/issues/7327
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7747]: https://gitlab.freedesktop.org/drm/intel/issues/7747
  [i915#7816]: https://gitlab.freedesktop.org/drm/intel/issues/7816
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7916]: https://gitlab.freedesktop.org/drm/intel/issues/7916
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8248]: https://gitlab.freedesktop.org/drm/intel/issues/8248
  [i915#8260]: https://gitlab.freedesktop.org/drm/intel/issues/8260
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8393]: https://gitlab.freedesktop.org/drm/intel/issues/8393
  [i915#8399]: https://gitlab.freedesktop.org/drm/intel/issues/8399
  [i915#8403]: https://gitlab.freedesktop.org/drm/intel/issues/8403
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
  [i915#8521]: https://gitlab.freedesktop.org/drm/intel/issues/8521
  [i915#8537]: https://gitlab.freedesktop.org/drm/intel/issues/8537
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8561]: https://gitlab.freedesktop.org/drm/intel/issues/8561
  [i915#8606]: https://gitlab.freedesktop.org/drm/intel/issues/8606
  [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
  [i915#8628]: https://gitlab.freedesktop.org/drm/intel/issues/8628
  [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
  [i915#8724]: https://gitlab.freedesktop.org/drm/intel/issues/8724
  [i915#8761]: https://gitlab.freedesktop.org/drm/intel/issues/8761


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7356 -> IGTPW_9308
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_13339: 77be79f64e6752073e4e44510d591699b06ef37d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9308: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/index.html
  IGT_7356: 66452bb0118e8d3a78d054cef50a60a9858a00a9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/index.html

--===============3499205435658274643==
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
<tr><td><b>Series:</b></td><td>tests/xe/xe_exec_store: Add xe_store test to check store dword functionality</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/120048/">https://patchwork.freedesktop.org/series/120048/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13339_full -&gt; IGTPW_9308_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9308_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9308_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9308_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_crc@cursor-rapid-movement-32x32:<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_crc@cursor-onscreen-32x10:<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8761">i915#8761</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> +12 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9308_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7701">i915#7701</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-5/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5507">i915#5507</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8260">i915#8260</a>)</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-rkl-1/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-7/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5507">i915#5507</a>)</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-tglu-7/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-5/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5507">i915#5507</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-apl7/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-apl2/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5507">i915#5507</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-glk8/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-glk3/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5507">i915#5507</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@drm_fdinfo@most-busy-idle-check-all@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-7/igt@feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-bltcopy:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-6/igt@gem_bad_reloc@negative-reloc-bltcopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-2/igt@gem_bad_reloc@negative-reloc-bltcopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-clear@smem0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-rkl-7/igt@gem_create@create-clear@smem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-2/igt@gem_create@create-clear@smem0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-snb4/igt@gem_ctx_persistence@engines-hostile.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-4/igt@gem_exec_capture@pi@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@gem_exec_capture@pi@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4475">i915#4475</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@gem_exec_fair@basic-none-solo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@gem_exec_reloc@basic-concurrent0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@deep@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-7/igt@gem_exec_schedule@deep@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@gem_exec_schedule@deep@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8606">i915#8606</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@gem_exec_whisper@basic-contexts-forked-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8628">i915#8628</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-7/igt@gem_exec_whisper@basic-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@gem_exec_whisper@basic-forked-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6363">i915#6363</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-snb4/igt@gem_exec_whisper@basic-queues.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +62 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-1/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-object:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-7/igt@gem_mmap@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-read-distinct:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-2/igt@gem_mmap_gtt@basic-write-read-distinct.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-7/igt@gem_mmap_gtt@fault-concurrent-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-2/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428">i915#8428</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-6/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@nohangcheck:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-1/igt@gem_userptr_blits@nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@gem_userptr_blits@nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7916">i915#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-apl2/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-apl6/igt@gen9_exec_parse@allowed-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-snb2/igt@i915_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-snb4/igt@i915_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8393">i915#8393</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-10/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-2/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-apl4/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-4/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-3/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7747">i915#7747</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-6/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-4/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-3/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@kms_async_flips@crc@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@kms_async_flips@crc@pipe-d-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8561">i915#8561</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-1/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_ccs:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-5/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-4/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3734">i915#3734</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-1/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-2/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-3/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@kms_content_protection@lic@pipe-a-dp-2.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-10/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8248">i915#8248</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@all-pipes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-8/igt@kms_cursor_legacy@single-move@all-pipes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-glk4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-7/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +1 similar issue</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-6/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-4/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-busy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@kms_vblank@pipe-c-query-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-1/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@enable-disable@0-rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-8/igt@perf@enable-disable@0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8724">i915#8724</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-2/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@vcs0:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-6/igt@perf_pmu@busy-idle@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-1/igt@perf_pmu@busy-idle@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) +7 similar issues</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-4/igt@perf_pmu@busy-idle@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-8/igt@perf_pmu@busy-idle@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@create-perfmon-exceed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-10/igt@v3d/v3d_perfmon@create-perfmon-exceed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-multisync-extension:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-5/igt@v3d/v3d_submit_cl@bad-multisync-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-4/igt@v3d/v3d_submit_cl@bad-multisync-extension.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-extension:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@v3d/v3d_submit_csd@bad-multisync-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-7/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-4/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-perfmon-invalid-events:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@vc4/vc4_perfmon@create-perfmon-invalid-events.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-7/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7816">i915#7816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full-pulse:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-11/igt@gem_exec_balancer@full-pulse.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6032">i915#6032</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-1/igt@gem_exec_balancer@full-pulse.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg1-19/igt@gem_exec_endless@dispatch@rcs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3778">i915#3778</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg1-15/igt@gem_exec_endless@dispatch@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-glk9/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-glk9/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preemptive-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-8/igt@gem_exec_schedule@preemptive-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7327">i915#7327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-1/igt@gem_exec_schedule@preemptive-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-4/igt@gem_exec_whisper@basic-forked.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6363">i915#6363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@gem_exec_whisper@basic-forked.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>
<p>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg1-19/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6227">i915#6227</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg1-15/igt@i915_module_load@load.html">PASS</a></p>
</li>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-10/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6227">i915#6227</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@i915_module_load@load.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-snb2/igt@i915_module_load@reload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-snb6/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7061">i915#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-4/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-tglu-6/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-4/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-3/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8403">i915#8403</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@bcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-glk7/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-glk3/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg1-16/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-5/igt@i915_pm_rpm@system-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-7/igt@i915_pm_rpm@system-suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@all-pipes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-4/igt@kms_cursor_legacy@single-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@kms_cursor_legacy@single-bo@all-pipes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-stridechange.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-tglu-3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-11/igt@perf_pmu@busy-double-start@ccs3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-11/igt@perf_pmu@busy-double-start@ccs3.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg1-16/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg1-14/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@perf_pmu@rc6@runtime-pm-long-gt1}:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-2/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8537">i915#8537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-3/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6015">i915#6015</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-2/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-5/igt@sysfs_preempt_timeout@timeout@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8521">i915#8521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@sysfs_preempt_timeout@timeout@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-dg2-1/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-dg2-12/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7162">i915#7162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5954">i915#5954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-rkl-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13339/shard-rkl-4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/shard-rkl-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7356 -&gt; IGTPW_9308</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13339: 77be79f64e6752073e4e44510d591699b06ef37d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9308: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9308/index.html<br />
  IGT_7356: 66452bb0118e8d3a78d054cef50a60a9858a00a9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3499205435658274643==--
