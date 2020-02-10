Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 10 Feb 2020 14:56:50 -0000
Message-ID: <158134661075.3098.7768218967262600465@emeril.freedesktop.org>
References: <20200206110110.5399-1-ranjeet1.kumar@intel.com>
In-Reply-To: <20200206110110.5399-1-ranjeet1.kumar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdC9p?=
 =?utf-8?q?915/gem=5Fpipe=5Fcontrol=5Fstore=5Floop=3A_Removal_of_test?=
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
To: ranjeet kumar <ranjeet1.kumar@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: test/i915/gem_pipe_control_store_loop: Removal of test
URL   : https://patchwork.freedesktop.org/series/73236/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7900 -> IGTPW_4120
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4120 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4120, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4120/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4120:

### IGT changes ###

#### Possible regressions ####

  * igt@prime_busy@basic-wait-after-default:
    - fi-skl-6770hq:      [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7900/fi-skl-6770hq/igt@prime_busy@basic-wait-after-default.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4120/fi-skl-6770hq/igt@prime_busy@basic-wait-after-default.html

  
Known issues
------------

  Here are the changes found in IGTPW_4120 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][3] -> [DMESG-FAIL][4] ([i915#725])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7900/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4120/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gtt:
    - fi-kbl-7500u:       [PASS][5] -> [TIMEOUT][6] ([fdo#112271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7900/fi-kbl-7500u/igt@i915_selftest@live_gtt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4120/fi-kbl-7500u/igt@i915_selftest@live_gtt.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][7] ([i915#553] / [i915#725]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7900/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4120/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gtt:
    - fi-skl-6600u:       [TIMEOUT][9] ([fdo#111732] / [fdo#112271]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7900/fi-skl-6600u/igt@i915_selftest@live_gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4120/fi-skl-6600u/igt@i915_selftest@live_gtt.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-kbl-7500u:       [FAIL][11] ([fdo#109635] / [i915#217]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7900/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4120/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][13] ([fdo#111407]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7900/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4120/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725


Participating hosts (51 -> 47)
------------------------------

  Additional (2): fi-byt-n2820 fi-bwr-2160 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5432 -> IGTPW_4120

  CI-20190529: 20190529
  CI_DRM_7900: f4ab479a4e3c9e0bc9120f6618b9876bfdece9cc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4120: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4120/index.html
  IGT_5432: 6677811be6e9be9000b3217e8862353b3945a4f3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

-igt@gem_pipe_control_store_loop@fresh-buffer
-igt@gem_pipe_control_store_loop@reused-buffer

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4120/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
