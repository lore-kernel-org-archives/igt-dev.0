Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 26 Feb 2020 16:48:44 -0000
Message-ID: <158273572445.21012.8458285194114110445@emeril.freedesktop.org>
References: <20200226134508.3374-1-swati2.sharma@intel.com>
In-Reply-To: <20200226134508.3374-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=3A_add_test_to_validate_immutable_zpos?=
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

Series: tests/kms_atomic: add test to validate immutable zpos
URL   : https://patchwork.freedesktop.org/series/73956/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8007 -> IGTPW_4229
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/index.html

Known issues
------------

  Here are the changes found in IGTPW_4229 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_getparams_basic@basic-eu-total:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([CI#94] / [i915#402])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/fi-tgl-y/igt@i915_getparams_basic@basic-eu-total.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/fi-tgl-y/igt@i915_getparams_basic@basic-eu-total.html

  
#### Possible fixes ####

  * igt@gem_flink_basic@bad-flink:
    - fi-tgl-y:           [DMESG-WARN][3] ([CI#94] / [i915#402]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/fi-tgl-y/igt@gem_flink_basic@bad-flink.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/fi-tgl-y/igt@gem_flink_basic@bad-flink.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (48 -> 44)
------------------------------

  Additional (1): fi-tgl-u 
  Missing    (5): fi-hsw-4200u fi-bdw-gvtdvm fi-byt-squawks fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5469 -> IGTPW_4229

  CI-20190529: 20190529
  CI_DRM_8007: 8dbfb8dcfb623026de73fdb617785f507064af89 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4229: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/index.html
  IGT_5469: 4f875016eb1ebc211b8aadb280ae16c7e6cdc8ba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_atomic@plane_immutable_zpos
+igt@kms_atomic@plane_primary_overlay_mutable_zpos
-igt@kms_atomic@plane_primary_overlay_zpos

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
