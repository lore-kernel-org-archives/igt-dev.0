Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 20 Feb 2020 15:38:48 -0000
Message-ID: <158221312888.17409.15935976577123648655@emeril.freedesktop.org>
References: <20200220143237.18855-1-maciej.ramotowski@intel.com>
In-Reply-To: <20200220143237.18855-1-maciej.ramotowski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgUmVkdWNl?=
 =?utf-8?q?_Docker_images_size?=
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
To: "Ramotowski, Maciej" <maciej.ramotowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Reduce Docker images size
URL   : https://patchwork.freedesktop.org/series/73717/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7973 -> IGTPW_4197
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4197/index.html

New tests
---------

  New tests have been introduced between CI_DRM_7973 and IGTPW_4197:

### New IGT tests (4) ###

  * igt@i915_pm_backlight@basic-brightness:
    - Statuses : 1 dmesg-warn(s) 17 pass(s) 24 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - Statuses : 1 dmesg-warn(s) 30 pass(s) 11 skip(s)
    - Exec time: [0.0, 6.85] s

  * igt@i915_pm_rpm@basic-rte:
    - Statuses : 1 dmesg-warn(s) 30 pass(s) 11 skip(s)
    - Exec time: [0.44, 24.41] s

  * igt@i915_pm_rps@basic-api:
    - Statuses : 37 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_4197 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-4770:        [PASS][1] -> [TIMEOUT][2] ([fdo#112271] / [i915#1084])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-hsw-4770/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4197/fi-hsw-4770/igt@gem_close_race@basic-threads.html

  * igt@i915_getparams_basic@basic-subslice-total:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([CI#94] / [i915#402]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4197/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-guc:         [PASS][5] -> [INCOMPLETE][6] ([fdo#106070] / [i915#424])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4197/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-bsw-n3050:       [PASS][7] -> [FAIL][8] ([i915#34])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4197/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_sanitycheck:
    - fi-icl-u3:          [DMESG-WARN][9] ([i915#585]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4197/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [FAIL][11] ([i915#217]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4197/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
    - fi-kbl-7500u:       [FAIL][13] ([fdo#111407]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4197/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [DMESG-WARN][15] ([CI#94] / [i915#402]) -> [PASS][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4197/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
#### Warnings ####

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-icl-u3:          [SKIP][17] ([fdo#109315]) -> [SKIP][18] ([fdo#109315] / [i915#585])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4197/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#106070]: https://bugs.freedesktop.org/show_bug.cgi?id=106070
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#585]: https://gitlab.freedesktop.org/drm/intel/issues/585


Participating hosts (49 -> 45)
------------------------------

  Additional (4): fi-kbl-soraka fi-skl-lmem fi-ivb-3770 fi-pnv-d510 
  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-j1900 fi-skl-6770hq fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5453 -> IGTPW_4197

  CI-20190529: 20190529
  CI_DRM_7973: 07350317e4b2be54b1de7f1e73f77875df5e43f3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4197: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4197/index.html
  IGT_5453: cae9a5881ed2c5be2c2518a255740b612a927f9a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4197/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
