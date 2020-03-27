Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 27 Mar 2020 14:09:22 -0000
Message-ID: <158531816200.17235.16534896092256660345@emeril.freedesktop.org>
References: <20200327131222.26945-1-swati2.sharma@intel.com>
In-Reply-To: <20200327131222.26945-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv5=2C1/2=5D_tests/kms=5Fatomic=3A_Add?=
 =?utf-8?q?_test_to_validate_immutable_zpos?=
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
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,v5,1/2] tests/kms_atomic: Add test to validate immutable zpos
URL   : https://patchwork.freedesktop.org/series/75170/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8202 -> IGTPW_4366
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/index.html

Known issues
------------

  Here are the changes found in IGTPW_4366 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-skl-6600u:       [PASS][1] -> [INCOMPLETE][2] ([i915#656])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/fi-skl-6600u/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/fi-skl-6600u/igt@i915_selftest@live@execlists.html
    - fi-bxt-dsi:         [PASS][3] -> [INCOMPLETE][4] ([fdo#103927] / [i915#656])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/fi-bxt-dsi/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-kefka:       [DMESG-FAIL][5] ([i915#1314]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/fi-bsw-kefka/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/fi-bsw-kefka/igt@i915_selftest@live@execlists.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [i915#1314]: https://gitlab.freedesktop.org/drm/intel/issues/1314
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656


Participating hosts (47 -> 42)
------------------------------

  Additional (2): fi-skl-lmem fi-kbl-7560u 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5542 -> IGTPW_4366

  CI-20190529: 20190529
  CI_DRM_8202: 3d926ba12446374635f2fc299233742ffc1ba69a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4366: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/index.html
  IGT_5542: 633ae927e4924006040f075841ef8d98751ce3b4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_atomic@atomic-invalid-params
+igt@kms_atomic@crtc-invalid-params
+igt@kms_atomic@crtc-invalid-params-fence
+igt@kms_atomic@plane-cursor-legacy
+igt@kms_atomic@plane-immutable-zpos
+igt@kms_atomic@plane-invalid-params
+igt@kms_atomic@plane-invalid-params-fence
+igt@kms_atomic@plane-overlay-legacy
+igt@kms_atomic@plane-primary-legacy
+igt@kms_atomic@plane-primary-overlay-mutable-zpos
+igt@kms_atomic@test-only
-igt@kms_atomic@atomic_invalid_params
-igt@kms_atomic@crtc_invalid_params
-igt@kms_atomic@crtc_invalid_params_fence
-igt@kms_atomic@plane_cursor_legacy
-igt@kms_atomic@plane_invalid_params
-igt@kms_atomic@plane_invalid_params_fence
-igt@kms_atomic@plane_overlay_legacy
-igt@kms_atomic@plane_primary_legacy
-igt@kms_atomic@plane_primary_overlay_zpos
-igt@kms_atomic@test_only

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
