Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jan 2020 08:06:06 -0000
Message-ID: <157985316615.15089.4562316849082170677@emeril.freedesktop.org>
References: <20200124071246.18147-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200124071246.18147-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fcollection=3A_documentation_fix?=
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

Series: lib/igt_collection: documentation fix
URL   : https://patchwork.freedesktop.org/series/72509/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7806 -> IGTPW_3984
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/index.html

Known issues
------------

  Here are the changes found in IGTPW_3984 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-8700k:       [PASS][1] -> [INCOMPLETE][2] ([i915#505])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-bsw-nick:        [DMESG-FAIL][3] ([i915#723]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-bsw-nick/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/fi-bsw-nick/igt@i915_selftest@live_blt.html
    - fi-hsw-4770r:       [DMESG-FAIL][5] ([i915#563]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-ivb-3770:        [DMESG-FAIL][7] ([i915#725]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][9] ([fdo#111407]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][11] ([i915#770]) -> [DMESG-FAIL][12] ([i915#725])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#505]: https://gitlab.freedesktop.org/drm/intel/issues/505
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#723]: https://gitlab.freedesktop.org/drm/intel/issues/723
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770


Participating hosts (52 -> 42)
------------------------------

  Additional (1): fi-snb-2520m 
  Missing    (11): fi-ilk-m540 fi-bsw-n3050 fi-byt-j1900 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-tgl-y fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5382 -> IGTPW_3984

  CI-20190529: 20190529
  CI_DRM_7806: 0b551226df5e5b84044705d5fd76571da70f3163 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3984: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/index.html
  IGT_5382: 8dbe5ce61baa2d563d4dd7c56a018bb1e1077467 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
