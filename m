Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 21 Feb 2020 19:02:17 -0000
Message-ID: <158231173724.7917.5785272046758789303@emeril.freedesktop.org>
References: <20200221182657.340-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200221182657.340-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/igt=5Fdebugfs=3A_Add_igt?=
 =?utf-8?b?X2NyY19nZXRfcHJldmlvdXMoKQ==?=
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/igt_debugfs: Add igt_crc_get_previous()
URL   : https://patchwork.freedesktop.org/series/73787/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5458 -> IGTPW_4213
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4213 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4213, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4213/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4213:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_gt_engines:
    - fi-bwr-2160:        [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/fi-bwr-2160/igt@i915_selftest@live_gt_engines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4213/fi-bwr-2160/igt@i915_selftest@live_gt_engines.html

  
Known issues
------------

  Here are the changes found in IGTPW_4213 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-process:
    - fi-byt-j1900:       [PASS][3] -> [FAIL][4] ([i915#694])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/fi-byt-j1900/igt@gem_close_race@basic-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4213/fi-byt-j1900/igt@gem_close_race@basic-process.html

  * igt@i915_selftest@live_sanitycheck:
    - fi-icl-u3:          [PASS][5] -> [DMESG-WARN][6] ([i915#585])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4213/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][7] -> [FAIL][8] ([fdo#111096] / [i915#323])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4213/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@prime_self_import@basic-with_fd_dup:
    - fi-tgl-y:           [PASS][9] -> [DMESG-WARN][10] ([CI#94] / [i915#402]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/fi-tgl-y/igt@prime_self_import@basic-with_fd_dup.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4213/fi-tgl-y/igt@prime_self_import@basic-with_fd_dup.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [INCOMPLETE][11] ([i915#45]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4213/fi-byt-n2820/igt@gem_close_race@basic-threads.html
    - fi-hsw-4770:        [TIMEOUT][13] ([fdo#112271] / [i915#1084]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/fi-hsw-4770/igt@gem_close_race@basic-threads.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4213/fi-hsw-4770/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-guc:         [DMESG-FAIL][15] ([i915#623]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4213/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gtt:
    - fi-skl-6600u:       [TIMEOUT][17] ([fdo#111732] / [fdo#112271]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/fi-skl-6600u/igt@i915_selftest@live_gtt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4213/fi-skl-6600u/igt@i915_selftest@live_gtt.html

  * igt@kms_addfb_basic@addfb25-y-tiled:
    - fi-tgl-y:           [DMESG-WARN][19] ([CI#94] / [i915#402]) -> [PASS][20] +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/fi-tgl-y/igt@kms_addfb_basic@addfb25-y-tiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4213/fi-tgl-y/igt@kms_addfb_basic@addfb25-y-tiled.html

  
#### Warnings ####

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-icl-u3:          [SKIP][21] ([fdo#109315] / [i915#585]) -> [SKIP][22] ([fdo#109315])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4213/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [INCOMPLETE][23] ([i915#45]) -> [TIMEOUT][24] ([fdo#112271] / [i915#1084] / [i915#816])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4213/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#585]: https://gitlab.freedesktop.org/drm/intel/issues/585
  [i915#623]: https://gitlab.freedesktop.org/drm/intel/issues/623
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816


Participating hosts (53 -> 45)
------------------------------

  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-skl-6770hq fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5458 -> IGTPW_4213

  CI-20190529: 20190529
  CI_DRM_7982: f02659605b48dcabb562bbb96db2996b334e57fd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4213: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4213/index.html
  IGT_5458: 5f7e4ae6a91ed2c104593b8abd5b71a6cc96fc10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4213/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
