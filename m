Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Mar 2020 07:47:47 -0000
Message-ID: <158443126741.5180.10144611587416179593@emeril.freedesktop.org>
References: <20200317071906.28879-1-swati2.sharma@intel.com>
In-Reply-To: <20200317071906.28879-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=3A_add_test_to_validate_immutable_zpos_=28rev4=29?=
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

Series: tests/kms_atomic: add test to validate immutable zpos (rev4)
URL   : https://patchwork.freedesktop.org/series/73956/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8139 -> IGTPW_4314
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/index.html

Known issues
------------

  Here are the changes found in IGTPW_4314 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-cml-s:           [PASS][1] -> [DMESG-FAIL][2] ([i915#877])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/fi-cml-s/igt@i915_selftest@live@gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/fi-cml-s/igt@i915_selftest@live@gem_contexts.html

  
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877


Participating hosts (43 -> 35)
------------------------------

  Additional (3): fi-kbl-soraka fi-bwr-2160 fi-bsw-nick 
  Missing    (11): fi-tgl-dsi fi-hsw-4200u fi-hsw-peppy fi-skl-6770hq fi-byt-squawks fi-bsw-cyan fi-ivb-3770 fi-skl-lmem fi-kbl-7560u fi-byt-clapper fi-snb-2600 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5512 -> IGTPW_4314

  CI-20190529: 20190529
  CI_DRM_8139: 1516ff1b2279ede916d81b1978da0428414705f8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4314: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/index.html
  IGT_5512: f6fef7eff6f121e5e89afd7e70116f471ccd5b8b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_atomic@plane_immutable_zpos
+igt@kms_atomic@plane_primary_overlay_mutable_zpos
-igt@kms_atomic@plane_primary_overlay_zpos

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4314/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
