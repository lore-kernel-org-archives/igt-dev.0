Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 11 Mar 2020 09:23:34 -0000
Message-ID: <158391861497.13953.2472626600563887445@emeril.freedesktop.org>
References: <20200311004235.138072-1-jose.souza@intel.com>
In-Reply-To: <20200311004235.138072-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bv2=2C1/4=5D_tests/kms=5Ffrontbuffer=5Ftrackin?=
 =?utf-8?q?g=3A_Add_tiling_to_test=5Fmode?=
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v2,1/4] tests/kms_frontbuffer_tracking: Add tiling to test_mode
URL   : https://patchwork.freedesktop.org/series/74549/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8112 -> IGTPW_4289
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4289:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@runner@aborted:
    - {fi-kbl-7560u}:     NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/fi-kbl-7560u/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4289 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_getparams_basic@basic-eu-total:
    - fi-tgl-y:           [PASS][2] -> [DMESG-WARN][3] ([CI#94] / [i915#402])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/fi-tgl-y/igt@i915_getparams_basic@basic-eu-total.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/fi-tgl-y/igt@i915_getparams_basic@basic-eu-total.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [FAIL][4] ([CI#94]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@kms_addfb_basic@unused-modifier:
    - fi-tgl-y:           [DMESG-WARN][6] ([CI#94] / [i915#402]) -> [PASS][7] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/fi-tgl-y/igt@kms_addfb_basic@unused-modifier.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/fi-tgl-y/igt@kms_addfb_basic@unused-modifier.html

  
#### Warnings ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][8] ([fdo#111407]) -> [FAIL][9] ([fdo#111096] / [i915#323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112259]: https://bugs.freedesktop.org/show_bug.cgi?id=112259
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#998]: https://gitlab.freedesktop.org/drm/intel/issues/998


Participating hosts (44 -> 44)
------------------------------

  Additional (4): fi-skl-6770hq fi-bsw-nick fi-skl-6600u fi-bsw-n3050 
  Missing    (4): fi-byt-squawks fi-byt-clapper fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5504 -> IGTPW_4289

  CI-20190529: 20190529
  CI_DRM_8112: 032f2fe5c92eb1db6d417738431153c001a41bcc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4289: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/index.html
  IGT_5504: d6788bf0404f76b66170e18eb26c85004b5ccb25 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear
+igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-linear
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-y
+igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear
+igt@kms_frontbuffer_tracking@fbcpsr-tiling-y
+igt@kms_frontbuffer_tracking@fbc-tiling-linear
+igt@kms_frontbuffer_tracking@fbc-tiling-y
-igt@kms_frontbuffer_tracking@fbcdrrs-tilingchange
-igt@kms_frontbuffer_tracking@fbcpsrdrrs-tilingchange
-igt@kms_frontbuffer_tracking@fbcpsr-tilingchange
-igt@kms_frontbuffer_tracking@fbc-tilingchange

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
