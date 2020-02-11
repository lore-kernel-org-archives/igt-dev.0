Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 11 Feb 2020 15:34:11 -0000
Message-ID: <158143525145.23974.18200858502101028961@emeril.freedesktop.org>
References: <20200211111634.10802-1-jani.nikula@intel.com>
In-Reply-To: <20200211111634.10802-1-jani.nikula@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9w?=
 =?utf-8?q?m=5Fbacklight=3A_ensure_driver_is_loaded_before_checking_backli?=
 =?utf-8?q?ght?=
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
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/pm_backlight: ensure driver is loaded before checking backlight
URL   : https://patchwork.freedesktop.org/series/73287/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7909 -> IGTPW_4126
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4126 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4126, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4126/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4126:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_blt:
    - fi-snb-2520m:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7909/fi-snb-2520m/igt@i915_selftest@live_blt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4126/fi-snb-2520m/igt@i915_selftest@live_blt.html

  
Known issues
------------

  Here are the changes found in IGTPW_4126 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [PASS][3] -> [FAIL][4] ([i915#178])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7909/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4126/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [PASS][5] -> [DMESG-FAIL][6] ([fdo#108569])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7909/fi-icl-y/igt@i915_selftest@live_execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4126/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-8700k:       [PASS][7] -> [INCOMPLETE][8] ([i915#424])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7909/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4126/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
    - fi-cml-s:           [PASS][9] -> [DMESG-FAIL][10] ([i915#877])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7909/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4126/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gtt:
    - fi-kbl-7500u:       [PASS][11] -> [TIMEOUT][12] ([fdo#112271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7909/fi-kbl-7500u/igt@i915_selftest@live_gtt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4126/fi-kbl-7500u/igt@i915_selftest@live_gtt.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-skl-6600u:       [INCOMPLETE][13] ([fdo#112429]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7909/fi-skl-6600u/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4126/fi-skl-6600u/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][15] ([fdo#111096] / [i915#323]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7909/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4126/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [fdo#112429]: https://bugs.freedesktop.org/show_bug.cgi?id=112429
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877


Participating hosts (51 -> 46)
------------------------------

  Additional (1): fi-glk-dsi 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5435 -> IGTPW_4126

  CI-20190529: 20190529
  CI_DRM_7909: fe7b665ac9055da66900b250fd01e0d9ec4c2a3c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4126: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4126/index.html
  IGT_5435: 2b6d4476dde53c363b8808ed9f0dd5547ac78641 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4126/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
