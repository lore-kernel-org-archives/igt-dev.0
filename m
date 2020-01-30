Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jan 2020 21:16:04 -0000
Message-ID: <158041896406.21033.16415662990122321369@emeril.freedesktop.org>
References: <20200130204124.29907-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200130204124.29907-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fpersistence=3A_Convert_engine_subtests_to_dyna?=
 =?utf-8?q?mic?=
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ctx_persistence: Convert engine subtests to dynamic
URL   : https://patchwork.freedesktop.org/series/72793/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7845 -> IGTPW_4046
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4046 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4046, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4046/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4046:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_hangcheck:
    - fi-hsw-peppy:       NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4046/fi-hsw-peppy/igt@i915_selftest@live_hangcheck.html

  
Known issues
------------

  Here are the changes found in IGTPW_4046 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][2] -> [TIMEOUT][3] ([fdo#112271] / [i915#1084] / [i915#816])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4046/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-hsw-4770:        [PASS][4] -> [SKIP][5] ([fdo#109271]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4046/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][6] -> [FAIL][7] ([fdo#111096] / [i915#323])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4046/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [PASS][8] -> [DMESG-WARN][9] ([CI#94] / [i915#402]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4046/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
#### Possible fixes ####

  * igt@gem_ctx_create@basic-files:
    - fi-icl-guc:         [INCOMPLETE][10] ([fdo#109100]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/fi-icl-guc/igt@gem_ctx_create@basic-files.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4046/fi-icl-guc/igt@gem_ctx_create@basic-files.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [FAIL][12] ([CI#94]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4046/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_getparams_basic@basic-subslice-total:
    - fi-tgl-y:           [DMESG-WARN][14] ([CI#94] / [i915#402]) -> [PASS][15] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4046/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][16] ([i915#725]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4046/fi-ivb-3770/igt@i915_selftest@live_blt.html

  
#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [TIMEOUT][18] ([fdo#112271] / [i915#1084]) -> [FAIL][19] ([i915#694])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7845/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4046/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#109100]: https://bugs.freedesktop.org/show_bug.cgi?id=109100
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816


Participating hosts (45 -> 42)
------------------------------

  Additional (9): fi-kbl-soraka fi-hsw-peppy fi-bdw-gvtdvm fi-bwr-2160 fi-ilk-650 fi-elk-e7500 fi-blb-e6850 fi-bsw-nick fi-skl-6600u 
  Missing    (12): fi-icl-1065g7 fi-cml-u2 fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-cfl-8700k fi-snb-2520m fi-bsw-kefka fi-kbl-7560u fi-byt-clapper fi-bdw-samus fi-snb-2600 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5407 -> IGTPW_4046

  CI-20190529: 20190529
  CI_DRM_7845: 87712fc2ff1634223e993da943bc3c9c7ce96bad @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4046: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4046/index.html
  IGT_5407: a9d69f51dadbcbc53527671f87572d05c3370cba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+++ 16 lines
--- 90 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4046/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
