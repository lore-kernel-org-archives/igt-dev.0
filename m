Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 23 Mar 2020 18:55:19 -0000
Message-ID: <158498971906.9809.9221888830317028807@emeril.freedesktop.org>
References: <20200323181446.1270580-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200323181446.1270580-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9w?=
 =?utf-8?q?m=5Frc6=5Fresidency=3A_Trigger_waitboosts_on_intermittent_workl?=
 =?utf-8?q?oads?=
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

Series: i915/pm_rc6_residency: Trigger waitboosts on intermittent workloads
URL   : https://patchwork.freedesktop.org/series/74983/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8180 -> IGTPW_4342
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4342 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4342, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4342/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4342:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_contexts:
    - fi-pnv-d510:        [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8180/fi-pnv-d510/igt@i915_selftest@live@gt_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4342/fi-pnv-d510/igt@i915_selftest@live@gt_contexts.html

  
Known issues
------------

  Here are the changes found in IGTPW_4342 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-cml-s:           [PASS][3] -> [DMESG-FAIL][4] ([i915#877])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8180/fi-cml-s/igt@i915_selftest@live@gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4342/fi-cml-s/igt@i915_selftest@live@gem_contexts.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [PASS][5] -> [FAIL][6] ([i915#976])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8180/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4342/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bxt-dsi:         [INCOMPLETE][7] ([fdo#103927] / [i915#656]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8180/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4342/fi-bxt-dsi/igt@i915_selftest@live@execlists.html

  
#### Warnings ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-cfl-8700k:       [DMESG-FAIL][9] ([i915#481]) -> [INCOMPLETE][10] ([i915#424])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8180/fi-cfl-8700k/igt@i915_selftest@live@gem_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4342/fi-cfl-8700k/igt@i915_selftest@live@gem_contexts.html

  * igt@kms_chamelium@vga-hpd-fast:
    - fi-cml-u2:          [SKIP][11] ([fdo#109309]) -> [FAIL][12] ([i915#217])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8180/fi-cml-u2/igt@kms_chamelium@vga-hpd-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4342/fi-cml-u2/igt@kms_chamelium@vga-hpd-fast.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#481]: https://gitlab.freedesktop.org/drm/intel/issues/481
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (40 -> 39)
------------------------------

  Additional (10): fi-bdw-5557u fi-hsw-peppy fi-kbl-7500u fi-gdg-551 fi-elk-e7500 fi-skl-lmem fi-blb-e6850 fi-bsw-nick fi-skl-6600u fi-snb-2600 
  Missing    (11): fi-kbl-soraka fi-hsw-4770r fi-skl-6770hq fi-byt-squawks fi-icl-u2 fi-bsw-cyan fi-ctg-p8600 fi-bsw-kefka fi-bdw-samus fi-byt-clapper fi-skl-6700k2 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5530 -> IGTPW_4342

  CI-20190529: 20190529
  CI_DRM_8180: 257af0ddcea3a234dcb79579600f971edd47353f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4342: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4342/index.html
  IGT_5530: 2020d743940f06294d06006bb737be43fcd2881e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4342/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
