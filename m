Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Jan 2020 15:35:34 -0000
Message-ID: <157927533471.26755.9421472015305384632@emeril.freedesktop.org>
References: <20200117141453.9512-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200117141453.9512-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgU2ltcGxp?=
 =?utf-8?q?fy_working_on_tiled_surfaces_over_GenX_=28rev5=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Simplify working on tiled surfaces over GenX (rev5)
URL   : https://patchwork.freedesktop.org/series/71740/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7762 -> IGTPW_3934
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3934 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3934, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3934:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - fi-bsw-n3050:       NOTRUN -> [FAIL][1] +37 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-bsw-n3050/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
    - fi-pnv-d510:        NOTRUN -> [FAIL][2] +37 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-pnv-d510/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - fi-byt-j1900:       NOTRUN -> [FAIL][3] +37 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-byt-j1900/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled:
    - fi-bsw-kefka:       NOTRUN -> [FAIL][4] +37 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-bsw-kefka/igt@gem_render_copy@y-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
    - fi-elk-e7500:       NOTRUN -> [FAIL][5] +37 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-elk-e7500/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - fi-blb-e6850:       NOTRUN -> [FAIL][6] +37 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-blb-e6850/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - fi-ilk-650:         NOTRUN -> [FAIL][7] +37 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-ilk-650/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled:
    - fi-bwr-2160:        NOTRUN -> [FAIL][8] +37 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-bwr-2160/igt@gem_render_copy@yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - fi-bsw-nick:        NOTRUN -> [FAIL][9] +37 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-bsw-nick/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  
Known issues
------------

  Here are the changes found in IGTPW_3934 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-cml-s:           [PASS][10] -> [FAIL][11] ([fdo#103375])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-cml-s/igt@gem_exec_suspend@basic-s0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-cml-s/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_mmap_gtt@basic:
    - fi-icl-dsi:         [PASS][12] -> [DMESG-WARN][13] ([i915#109])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-icl-dsi/igt@gem_mmap_gtt@basic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-icl-dsi/igt@gem_mmap_gtt@basic.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-8700k:       [PASS][14] -> [DMESG-WARN][15] ([i915#889])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8700k:       [PASS][16] -> [INCOMPLETE][17] ([i915#148])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [PASS][18] -> [DMESG-FAIL][19] ([i915#770])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-hsw-4770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770r:       [PASS][20] -> [DMESG-FAIL][21] ([i915#553])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-icl-u2:          [PASS][22] -> [FAIL][23] ([fdo#109635])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][24] ([fdo#112271] / [i915#816]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-skl-6700k2:      [FAIL][26] ([fdo#103375]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-skl-6700k2/igt@gem_exec_suspend@basic-s0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-skl-6700k2/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-cml-s:           [DMESG-WARN][28] ([fdo#111764]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-cml-s/igt@gem_exec_suspend@basic-s3.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-cml-s/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6700k2:      [DMESG-WARN][30] ([i915#889]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
    - fi-skl-6770hq:      [DMESG-WARN][32] ([i915#889]) -> [PASS][33] +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][34] ([i915#725]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gt_lrc:
    - fi-skl-6600u:       [DMESG-FAIL][36] ([i915#889]) -> [PASS][37] +7 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html

  * igt@i915_selftest@live_late_gt_pm:
    - fi-skl-6600u:       [DMESG-WARN][38] ([i915#889]) -> [PASS][39] +23 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-skl-6600u/igt@i915_selftest@live_late_gt_pm.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-skl-6600u/igt@i915_selftest@live_late_gt_pm.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-snb-2520m:       [FAIL][40] ([i915#34]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-snb-2520m/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-snb-2520m/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
#### Warnings ####

  * igt@amdgpu/amd_prime@i915-to-amd:
    - fi-skl-6770hq:      [INCOMPLETE][42] -> [SKIP][43] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7762/fi-skl-6770hq/igt@amdgpu/amd_prime@i915-to-amd.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/fi-skl-6770hq/igt@amdgpu/amd_prime@i915-to-amd.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#109]: https://gitlab.freedesktop.org/drm/intel/issues/109
  [i915#148]: https://gitlab.freedesktop.org/drm/intel/issues/148
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (48 -> 46)
------------------------------

  Additional (3): fi-hsw-peppy fi-kbl-7560u fi-bdw-5557u 
  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5371 -> IGTPW_3934

  CI-20190529: 20190529
  CI_DRM_7762: 82b4da20384b69f4a71dd4a8f2cdf40077f46494 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3934: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/index.html
  IGT_5371: 1b2816124ec3dbd53b81725d39292f45d41d895b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3934/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
