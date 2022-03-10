Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2228351025000721244=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Thu, 10 Mar 2022 04:11:44 -0000
Message-ID: <164688550404.17009.4176600700715169295@emeril.freedesktop.org>
References: <20220309164452.8240-1-jeevan.b@intel.com>
In-Reply-To: <20220309164452.8240-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHRp?=
 =?utf-8?q?le_4_plane_format_support?=
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

--===============2228351025000721244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add tile 4 plane format support
URL   : https://patchwork.freedesktop.org/series/101205/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11346_full -> IGTPW_6765_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6765_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6765_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/index.html

Participating hosts (13 -> 8)
------------------------------

  Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6765_full:

### IGT changes ###

#### Possible regressions ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-glk1/igt@device_reset@unbind-reset-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk3/igt@device_reset@unbind-reset-rebind.html
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-apl1/igt@device_reset@unbind-reset-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl4/igt@device_reset@unbind-reset-rebind.html
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-kbl3/igt@device_reset@unbind-reset-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl1/igt@device_reset@unbind-reset-rebind.html
    - shard-iclb:         [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-iclb1/igt@device_reset@unbind-reset-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb1/igt@device_reset@unbind-reset-rebind.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-kbl:          [PASS][9] -> [TIMEOUT][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-kbl3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-apl:          [PASS][11] -> [TIMEOUT][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-apl6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][13] +18 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * {igt@kms_frontbuffer_tracking@fbcpsr-tiling-4} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][14] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping:
    - shard-iclb:         NOTRUN -> [SKIP][15] +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb8/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping.html

  * igt@testdisplay:
    - shard-apl:          NOTRUN -> [TIMEOUT][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl6/igt@testdisplay.html

  
#### Warnings ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-apl:          [SKIP][17] ([fdo#109271]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-apl4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-tglb:         [SKIP][19] ([i915#3826]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-tglb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-glk:          [SKIP][21] ([fdo#109271]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-glk9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-kbl:          [SKIP][23] ([fdo#109271]) -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-kbl1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-snb:          [SKIP][25] ([fdo#109271]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-snb5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-snb7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         [SKIP][27] ([i915#3826]) -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-iclb5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@device_reset@unbind-reset-rebind:
    - {shard-tglu}:       [PASS][29] -> [DMESG-WARN][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-tglu-2/igt@device_reset@unbind-reset-rebind.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglu-4/igt@device_reset@unbind-reset-rebind.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - {shard-tglu}:       [SKIP][31] ([i915#3826]) -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-tglu-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * {igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-1-downscale-with-pixel-format}:
    - {shard-tglu}:       NOTRUN -> [SKIP][33] +25 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglu-1/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-1-downscale-with-pixel-format.html

  * {igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format}:
    - shard-iclb:         [SKIP][34] ([i915#5176]) -> [SKIP][35] +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb8/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html

  * {igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format}:
    - shard-tglb:         [PASS][36] -> [SKIP][37] +19 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-tglb5/igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb7/igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format.html

  * {igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-c-edp-1-upscale-with-pixel-format}:
    - shard-iclb:         [PASS][38] -> [SKIP][39] +11 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-iclb3/igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-c-edp-1-upscale-with-pixel-format.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb1/igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-c-edp-1-upscale-with-pixel-format.html

  * {igt@kms_plane_scaling@upscale-with-pixel-format-factor-0-25@pipe-c-hdmi-a-1-upscale-with-pixel-format}:
    - {shard-tglu}:       [PASS][40] -> [SKIP][41] +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-tglu-2/igt@kms_plane_scaling@upscale-with-pixel-format-factor-0-25@pipe-c-hdmi-a-1-upscale-with-pixel-format.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglu-8/igt@kms_plane_scaling@upscale-with-pixel-format-factor-0-25@pipe-c-hdmi-a-1-upscale-with-pixel-format.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11346_full and IGTPW_6765_full:

### New IGT tests (3) ###

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_6765_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([i915#658])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-iclb2/igt@feature_discovery@psr2.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb8/igt@feature_discovery@psr2.html

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][44] ([i915#4991])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl1/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#1099])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-snb4/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#280])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb8/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         NOTRUN -> [FAIL][47] ([i915#232]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][48] ([i915#5076]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb5/igt@gem_exec_balancer@parallel-contexts.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][49] ([i915#5076])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl3/igt@gem_exec_balancer@parallel-contexts.html
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#4525])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_capture@pi@vcs0:
    - shard-iclb:         [PASS][51] -> [INCOMPLETE][52] ([i915#3371])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-iclb8/igt@gem_exec_capture@pi@vcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb1/igt@gem_exec_capture@pi@vcs0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][53] -> [FAIL][54] ([i915#2846])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][55] ([i915#2842]) +11 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][56] ([i915#2842]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [PASS][57] -> [FAIL][58] ([i915#2842])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][59] ([i915#2842]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_params@no-vebox:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109283] / [i915#4877])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb1/igt@gem_exec_params@no-vebox.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#2190])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl6/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#2190])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk1/igt@gem_huc_copy@huc-copy.html
    - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#2190])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb4/igt@gem_huc_copy@huc-copy.html
    - shard-kbl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#2190])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#4613]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl7/igt@gem_lmem_swapping@heavy-verify-multi.html
    - shard-apl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#4613]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl6/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#4613])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb2/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#4613]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk6/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#4613]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb1/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#4270]) +4 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb5/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#4270]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb4/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271]) +204 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([i915#768]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109312])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb3/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109312])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb1/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#3297]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#3297]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb7/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [PASS][78] -> [DMESG-WARN][79] ([i915#180])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-kbl3/igt@gem_workarounds@suspend-resume.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl7/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][80] -> [DMESG-WARN][81] ([i915#180]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl1/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][82] -> [DMESG-WARN][83] ([i915#1436] / [i915#716])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-apl8/igt@gen9_exec_parse@allowed-all.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl8/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#2527] / [i915#2856]) +4 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb7/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([i915#2856]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb2/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][86] ([i915#454])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#111644] / [i915#1397] / [i915#2411])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#110892])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-snb:          NOTRUN -> [SKIP][89] ([fdo#109271]) +137 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-snb2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109293] / [fdo#109506])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb7/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         NOTRUN -> [SKIP][91] ([fdo#109506] / [i915#2411])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb8/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#4387])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb1/igt@i915_pm_sseu@full-enable.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#1769])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-glk:          [PASS][94] -> [DMESG-WARN][95] ([i915#118])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-glk3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#111614]) +3 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#3777]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#3777]) +3 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#111615]) +5 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#110723]) +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#2705])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb7/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109278] / [i915#3886]) +6 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb4/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#3886]) +8 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#3689] / [i915#3886]) +4 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([i915#3689]) +9 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([fdo#111615] / [i915#3689]) +4 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb5/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#3886]) +6 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html
    - shard-apl:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#3886]) +4 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl2/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([fdo#109278]) +26 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb6/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([i915#3742])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb5/igt@kms_cdclk@plane-scaling.html
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#3742])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb6/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@dp-frame-dump:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb5/igt@kms_chamelium@dp-frame-dump.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl7/igt@kms_chamelium@vga-hpd.html
    - shard-tglb:         NOTRUN -> [SKIP][115] ([fdo#109284] / [fdo#111827]) +15 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb2/igt@kms_chamelium@vga-hpd.html
    - shard-glk:          NOTRUN -> [SKIP][116] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk9/igt@kms_chamelium@vga-hpd.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][117] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-snb2/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-d-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][118] ([fdo#109278] / [i915#1149])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb1/igt@kms_color@pipe-d-gamma.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl4/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-negative.html

  * igt@kms_content_protection@content_type_change:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb2/igt@kms_content_protection@content_type_change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][122] ([i915#3116])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb4/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglb:         NOTRUN -> [SKIP][123] ([i915#3116] / [i915#3299])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][124] ([i915#1063]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb2/igt@kms_content_protection@srm.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][125] ([i915#1319])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl4/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][126] ([i915#1319])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][127] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb5/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][128] ([fdo#109279] / [i915#3359]) +6 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][129] ([i915#3359]) +10 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][130] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][131] ([i915#4103])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][132] ([fdo#109274] / [fdo#111825]) +12 similar issues
   [132]: https://intel-gfx-

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/index.html

--===============2228351025000721244==
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
<tr><td><b>Series:</b></td><td>Add tile 4 plane format support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101205/">https://patchwork.freedesktop.org/series/101205/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11346_full -&gt; IGTPW_6765_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6765_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6765_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/index.html</p>
<h2>Participating hosts (13 -&gt; 8)</h2>
<p>Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6765_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-glk1/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk3/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-apl1/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl4/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-kbl3/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl1/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-iclb1/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb1/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-kbl3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-apl6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">TIMEOUT</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> +18 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_frontbuffer_tracking@fbcpsr-tiling-4} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb8/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-edp-1-scaler-with-clipping-clamping.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl6/igt@testdisplay.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-apl4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-tglb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-glk9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-kbl1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-snb5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-snb7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-iclb5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-tglu-2/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglu-4/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-tglu-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-1-downscale-with-pixel-format}:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglu-1/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-1-downscale-with-pixel-format.html">SKIP</a> +25 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html">SKIP</a> ([i915#5176]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb8/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-tglb5/igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb7/igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format.html">SKIP</a> +19 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-c-edp-1-upscale-with-pixel-format}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-iclb3/igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-c-edp-1-upscale-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb1/igt@kms_plane_scaling@upscale-with-pixel-format-20x20@pipe-c-edp-1-upscale-with-pixel-format.html">SKIP</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@upscale-with-pixel-format-factor-0-25@pipe-c-hdmi-a-1-upscale-with-pixel-format}:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-tglu-2/igt@kms_plane_scaling@upscale-with-pixel-format-factor-0-25@pipe-c-hdmi-a-1-upscale-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglu-8/igt@kms_plane_scaling@upscale-with-pixel-format-factor-0-25@pipe-c-hdmi-a-1-upscale-with-pixel-format.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11346_full and IGTPW_6765_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6765_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb8/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl1/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-snb4/igt@gem_ctx_persistence@legacy-engines-mixed-process.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb8/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb3/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#232]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb5/igt@gem_exec_balancer@parallel-contexts.html">DMESG-WARN</a> ([i915#5076]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl3/igt@gem_exec_balancer@parallel-contexts.html">DMESG-WARN</a> ([i915#5076])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4525])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-iclb8/igt@gem_exec_capture@pi@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb1/igt@gem_exec_capture@pi@vcs0.html">INCOMPLETE</a> ([i915#3371])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb1/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283] / [i915#4877])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk1/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb4/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl7/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl7/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl6/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb2/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk6/igt@gem_lmem_swapping@random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb1/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb5/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb4/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +204 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb3/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb1/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb1/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb7/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-kbl3/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl7/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-apl4/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl1/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-apl8/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl8/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> ([i915#1436] / [i915#716])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb7/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([i915#2527] / [i915#2856]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb2/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-snb2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([fdo#109271]) +137 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb7/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb8/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb1/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11346/shard-glk3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb2/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([fdo#110723]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb7/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb4/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +8 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb5/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +6 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl2/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb6/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278]) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb5/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb6/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-frame-dump:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb5/igt@kms_chamelium@dp-frame-dump.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl7/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb2/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +15 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-glk9/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-snb2/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb1/igt@kms_color@pipe-d-gamma.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl4/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-negative:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-negative.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb2/igt@kms_content_protection@content_type_change.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb4/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116] / [i915#3299])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb2/igt@kms_content_protection@srm.html">SKIP</a> ([i915#1063]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-kbl4/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-apl6/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb5/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html">SKIP</a> ([i915#3359]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-iclb5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6765/shard-tglb5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-">SKIP</a> ([fdo#109274] / [fdo#111825]) +12 similar issues</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2228351025000721244==--
