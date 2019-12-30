Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 30 Dec 2019 04:12:30 -0000
Message-ID: <157767915029.15517.16057991606027508953@emeril.freedesktop.org>
References: <20191230034040.21943-1-imre.deak@intel.com>
In-Reply-To: <20191230034040.21943-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliOiBB?=
 =?utf-8?q?dd_support_and_coverage_for_MC_YUV_formats?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: Add support and coverage for MC YUV formats
URL   : https://patchwork.freedesktop.org/series/71483/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7651 -> IGTPW_3889
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3889 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3889, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3889/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3889:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_client:
    - fi-skl-6600u:       [PASS][1] -> [DMESG-WARN][2] +9 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7651/fi-skl-6600u/igt@i915_selftest@live_client.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3889/fi-skl-6600u/igt@i915_selftest@live_client.html

  * igt@i915_selftest@live_reset:
    - fi-skl-6600u:       [PASS][3] -> [DMESG-FAIL][4] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7651/fi-skl-6600u/igt@i915_selftest@live_reset.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3889/fi-skl-6600u/igt@i915_selftest@live_reset.html

  
Known issues
------------

  Here are the changes found in IGTPW_3889 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6600u:       [PASS][5] -> [DMESG-WARN][6] ([i915#889]) +13 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7651/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3889/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-j1900:       [PASS][7] -> [DMESG-FAIL][8] ([i915#722])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7651/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3889/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gt_lrc:
    - fi-skl-6600u:       [PASS][9] -> [DMESG-FAIL][10] ([i915#889]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7651/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3889/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-bxt-dsi:         [INCOMPLETE][11] ([fdo#103927]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7651/fi-bxt-dsi/igt@i915_module_load@reload-with-fault-injection.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3889/fi-bxt-dsi/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_busy@basic-flip-pipe-a:
    - {fi-tgl-guc}:       [DMESG-WARN][13] ([i915#402]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7651/fi-tgl-guc/igt@kms_busy@basic-flip-pipe-a.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3889/fi-tgl-guc/igt@kms_busy@basic-flip-pipe-a.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-kbl-x1275:       [DMESG-WARN][15] ([fdo#107139] / [i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][16] ([fdo#107139] / [i915#62] / [i915#92])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7651/fi-kbl-x1275/igt@gem_exec_suspend@basic-s4-devices.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3889/fi-kbl-x1275/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-kbl-x1275:       [DMESG-WARN][17] ([i915#62] / [i915#92]) -> [DMESG-WARN][18] ([i915#62] / [i915#92] / [i915#95]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7651/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3889/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-kbl-x1275:       [DMESG-WARN][19] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][20] ([i915#62] / [i915#92]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7651/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3889/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107139]: https://bugs.freedesktop.org/show_bug.cgi?id=107139
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (44 -> 33)
------------------------------

  Additional (4): fi-hsw-4770r fi-skl-6770hq fi-bsw-nick fi-hsw-4770 
  Missing    (15): fi-ilk-m540 fi-bsw-n3050 fi-hsw-4200u fi-glk-dsi fi-byt-squawks fi-bwr-2160 fi-snb-2520m fi-ctg-p8600 fi-whl-u fi-bsw-kefka fi-skl-lmem fi-byt-n2820 fi-byt-clapper fi-bdw-samus fi-kbl-r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5352 -> IGTPW_3889

  CI-20190529: 20190529
  CI_DRM_7651: dcd9b47d596ff82b9768f1ecba436ef03073c211 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3889: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3889/index.html
  IGT_5352: 0586d205f651674e575351c2d5a7d0760716c9f1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3889/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
