Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Jan 2020 08:49:10 -0000
Message-ID: <157804135028.20613.17932748799818463616@emeril.freedesktop.org>
References: <20200103081107.28144-1-ramalingam.c@intel.com>
In-Reply-To: <20200103081107.28144-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Iga21zX2Nv?=
 =?utf-8?q?ntent=5Fprotection=3A_add_check_for_DPMS_off_state?=
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
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: kms_content_protection: add check for DPMS off state
URL   : https://patchwork.freedesktop.org/series/71590/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7671 -> IGTPW_3894
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3894 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3894, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3894/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3894:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_busy@basic-flip-pipe-b:
    - fi-tgl-y:           NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3894/fi-tgl-y/igt@kms_busy@basic-flip-pipe-b.html

  
Known issues
------------

  Here are the changes found in IGTPW_3894 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-skl-6600u:       [PASS][2] -> [INCOMPLETE][3] ([i915#146] / [i915#69])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7671/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3894/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-kbl-x1275:       [PASS][4] -> [INCOMPLETE][5] ([i915#879])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7671/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3894/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [PASS][6] -> [FAIL][7] ([i915#579])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7671/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3894/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][8] -> [DMESG-FAIL][9] ([i915#725])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7671/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3894/fi-ivb-3770/igt@i915_selftest@live_blt.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-cml-s:           [INCOMPLETE][10] ([i915#283]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7671/fi-cml-s/igt@gem_exec_suspend@basic-s0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3894/fi-cml-s/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][12] ([i915#725]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7671/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3894/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-guc:         [DMESG-FAIL][14] ([i915#623]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7671/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3894/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html

  
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#283]: https://gitlab.freedesktop.org/drm/intel/issues/283
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#623]: https://gitlab.freedesktop.org/drm/intel/issues/623
  [i915#69]: https://gitlab.freedesktop.org/drm/intel/issues/69
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879


Participating hosts (48 -> 47)
------------------------------

  Additional (5): fi-hsw-peppy fi-bwr-2160 fi-snb-2520m fi-gdg-551 fi-tgl-y 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5357 -> IGTPW_3894

  CI-20190529: 20190529
  CI_DRM_7671: 2348d330223761be0a66ce3725d9be35fec0019a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3894: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3894/index.html
  IGT_5357: a555a4b98f90dab655d24bb3d07e9291a8b8dac8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3894/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
