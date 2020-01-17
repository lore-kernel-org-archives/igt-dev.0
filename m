Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Jan 2020 17:57:14 -0000
Message-ID: <157928383404.26757.3353141123800791314@emeril.freedesktop.org>
References: <20200117171545.3212625-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200117171545.3212625-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/5=5D_lib/intel=5Fbufops=3A_Introduc?=
 =?utf-8?q?e_buffer_operations?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/5] lib/intel_bufops: Introduce buffer operations
URL   : https://patchwork.freedesktop.org/series/72210/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7764 -> IGTPW_3935
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_3935 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3935, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3935:

### IGT changes ###

#### Warnings ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-cml-u2:          [FAIL][1] ([i915#410]) -> [SKIP][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/fi-cml-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/fi-cml-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  
Known issues
------------

  Here are the changes found in IGTPW_3935 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][3] ([i915#770]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gt_lrc:
    - fi-skl-6600u:       [DMESG-FAIL][5] ([i915#889]) -> [PASS][6] +7 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html

  * igt@i915_selftest@live_late_gt_pm:
    - fi-skl-6600u:       [DMESG-WARN][7] ([i915#889]) -> [PASS][8] +23 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/fi-skl-6600u/igt@i915_selftest@live_late_gt_pm.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/fi-skl-6600u/igt@i915_selftest@live_late_gt_pm.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-cml-u2:          [FAIL][9] ([i915#410]) -> [PASS][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/fi-cml-u2/igt@kms_chamelium@dp-hpd-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/fi-cml-u2/igt@kms_chamelium@dp-hpd-fast.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-guc:         [INCOMPLETE][11] ([i915#505] / [i915#671]) -> [DMESG-WARN][12] ([i915#889])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/fi-cfl-guc/igt@i915_module_load@reload-with-fault-injection.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/fi-cfl-guc/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-cml-u2:          [FAIL][13] ([i915#410]) -> [DMESG-WARN][14] ([IGT#4])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@vga-hpd-fast:
    - fi-cml-u2:          [FAIL][15] ([i915#410]) -> [SKIP][16] ([fdo#109309]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7764/fi-cml-u2/igt@kms_chamelium@vga-hpd-fast.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/fi-cml-u2/igt@kms_chamelium@vga-hpd-fast.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [i915#410]: https://gitlab.freedesktop.org/drm/intel/issues/410
  [i915#505]: https://gitlab.freedesktop.org/drm/intel/issues/505
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (44 -> 46)
------------------------------

  Additional (7): fi-hsw-4770r fi-skl-6770hq fi-kbl-7500u fi-kbl-7560u fi-tgl-y fi-bsw-nick fi-snb-2600 
  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-ivb-3770 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5371 -> IGTPW_3935

  CI-20190529: 20190529
  CI_DRM_7764: 390553573eeaaf2d76f53d5fa3dc1aff9acd9140 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3935: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/index.html
  IGT_5371: 1b2816124ec3dbd53b81725d39292f45d41d895b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3935/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
