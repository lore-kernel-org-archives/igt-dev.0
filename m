Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jan 2020 02:22:51 -0000
Message-ID: <158035097132.21035.7464731808526400691@emeril.freedesktop.org>
References: <20200130012358.5798-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20200130012358.5798-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/i915/gem=5Fmadvise=3A_Us?=
 =?utf-8?q?e_gem=5Fmmap=5F=5Fdevice=5Fcoherent?=
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
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/i915/gem_madvise: Use gem_mmap__device_coherent
URL   : https://patchwork.freedesktop.org/series/72755/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7839 -> IGTPW_4038
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4038 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4038, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4038:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - fi-bsw-kefka:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/fi-bsw-kefka/igt@runner@aborted.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-cml-s:           [FAIL][2] ([fdo#103375]) -> [TIMEOUT][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/fi-cml-s/igt@gem_exec_suspend@basic-s3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/fi-cml-s/igt@gem_exec_suspend@basic-s3.html

  
Known issues
------------

  Here are the changes found in IGTPW_4038 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][4] -> [TIMEOUT][5] ([fdo#112271] / [i915#816])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/fi-byt-j1900/igt@gem_close_race@basic-threads.html
    - fi-byt-n2820:       [PASS][6] -> [TIMEOUT][7] ([fdo#112271] / [i915#816])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][8] -> [DMESG-FAIL][9] ([i915#553] / [i915#725])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-ivb-3770:        [PASS][10] -> [DMESG-FAIL][11] ([i915#725])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [PASS][12] -> [DMESG-FAIL][13] ([i915#725])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-cml-s:           [FAIL][14] ([fdo#103375]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/fi-cml-s/igt@gem_exec_suspend@basic-s0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/fi-cml-s/igt@gem_exec_suspend@basic-s0.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][16] ([fdo#111407]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7839/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816


Participating hosts (47 -> 47)
------------------------------

  Additional (4): fi-hsw-peppy fi-kbl-7560u fi-bsw-kefka fi-kbl-r 
  Missing    (4): fi-byt-squawks fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5406 -> IGTPW_4038

  CI-20190529: 20190529
  CI_DRM_7839: 41a9319a45aaf77e220c8101d6ce76ec66036ffc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4038: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/index.html
  IGT_5406: 786c79af483a9f6e4688811f74116030c734ca1f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4038/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
