Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 16 Mar 2020 18:59:25 -0000
Message-ID: <158438516532.18995.124432109316343222@emeril.freedesktop.org>
References: <20200316183422.25831-1-swati2.sharma@intel.com>
In-Reply-To: <20200316183422.25831-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=3A_add_test_to_validate_immutable_zpos_=28rev3=29?=
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
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_atomic: add test to validate immutable zpos (rev3)
URL   : https://patchwork.freedesktop.org/series/73956/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5511 -> IGTPW_4312
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4312 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4312, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4312/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4312:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-skl-6770hq:      [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5511/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-modeset.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4312/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-modeset.html

  
#### Warnings ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-skl-lmem:        [INCOMPLETE][3] ([i915#424]) -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5511/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4312/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html

  
Known issues
------------

  Here are the changes found in IGTPW_4312 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [PASS][5] -> [FAIL][6] ([CI#94])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5511/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4312/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][7] -> [FAIL][8] ([i915#323])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5511/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4312/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@active:
    - fi-apl-guc:         [DMESG-FAIL][9] ([i915#666]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5511/fi-apl-guc/igt@i915_selftest@live@active.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4312/fi-apl-guc/igt@i915_selftest@live@active.html

  * igt@i915_selftest@live@execlists:
    - fi-apl-guc:         [INCOMPLETE][11] ([fdo#103927] / [i915#656]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5511/fi-apl-guc/igt@i915_selftest@live@execlists.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4312/fi-apl-guc/igt@i915_selftest@live@execlists.html
    - fi-bxt-dsi:         [INCOMPLETE][13] ([fdo#103927] / [i915#656]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5511/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4312/fi-bxt-dsi/igt@i915_selftest@live@execlists.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#666]: https://gitlab.freedesktop.org/drm/intel/issues/666


Participating hosts (49 -> 44)
------------------------------

  Missing    (5): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5511 -> IGTPW_4312

  CI-20190529: 20190529
  CI_DRM_8137: 5786b5e77cc17a1b494b9bdf3c3f29eedc2e2e7d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4312: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4312/index.html
  IGT_5511: abbda1426424cf32c134107a0c892bfa61234d0b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_atomic@plane_immutable_zpos
+igt@kms_atomic@plane_primary_overlay_mutable_zpos
-igt@kms_atomic@plane_primary_overlay_zpos

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4312/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
