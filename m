Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Jan 2020 22:40:36 -0000
Message-ID: <157956003613.681.10408630521748150042@emeril.freedesktop.org>
References: <20200120114252.788-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200120114252.788-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fcollection=3A_Adding_combinatorics_facility?=
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

Series: lib/igt_collection: Adding combinatorics facility
URL   : https://patchwork.freedesktop.org/series/72276/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5373 -> IGTPW_3952
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3952 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3952, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3952/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3952:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_requests:
    - fi-hsw-4770r:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/fi-hsw-4770r/igt@i915_selftest@live_requests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3952/fi-hsw-4770r/igt@i915_selftest@live_requests.html

  
Known issues
------------

  Here are the changes found in IGTPW_3952 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][3] -> [FAIL][4] ([fdo#111096] / [i915#323])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3952/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][5] ([fdo#112271] / [i915#816]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3952/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-kbl-7500u:       [INCOMPLETE][7] ([i915#879]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/fi-kbl-7500u/igt@i915_module_load@reload-with-fault-injection.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3952/fi-kbl-7500u/igt@i915_module_load@reload-with-fault-injection.html
    - fi-skl-lmem:        [INCOMPLETE][9] ([i915#671]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3952/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][11] ([i915#563]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3952/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][13] ([i915#563]) -> [DMESG-FAIL][14] ([i915#725])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3952/fi-ivb-3770/igt@i915_selftest@live_blt.html

  
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879


Participating hosts (49 -> 43)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5373 -> IGTPW_3952

  CI-20190529: 20190529
  CI_DRM_7778: 8442e59b2b3aa0f081ee31fc13dcd0f31e5981e5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3952: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3952/index.html
  IGT_5373: 224e565df36693ab8ae8f58eb6ae42600c2464e2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3952/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
