Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Mar 2020 19:58:09 -0000
Message-ID: <158516628992.29636.3391043554595278264@emeril.freedesktop.org>
References: <20200325191819.10196-1-jose.souza@intel.com>
In-Reply-To: <20200325191819.10196-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv6=2Cwithout-hack-patches=2C1/5=5D_te?=
 =?utf-8?q?sts/kms=5Ffrontbuffer=5Ftracking=3A_Add_tiling_to_test=5Fmode?=
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

Series: series starting with [i-g-t,v6,without-hack-patches,1/5] tests/kms_frontbuffer_tracking: Add tiling to test_mode
URL   : https://patchwork.freedesktop.org/series/75086/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8189 -> IGTPW_4352
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/index.html

Known issues
------------

  Here are the changes found in IGTPW_4352 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [SKIP][1] ([fdo#109271]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@requests:
    - fi-icl-y:           [INCOMPLETE][3] ([fdo#109644] / [fdo#110464]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/fi-icl-y/igt@i915_selftest@live@requests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/fi-icl-y/igt@i915_selftest@live@requests.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109644]: https://bugs.freedesktop.org/show_bug.cgi?id=109644
  [fdo#110464]: https://bugs.freedesktop.org/show_bug.cgi?id=110464


Participating hosts (43 -> 38)
------------------------------

  Additional (6): fi-byt-j1900 fi-hsw-peppy fi-snb-2520m fi-gdg-551 fi-cfl-8109u fi-skl-lmem 
  Missing    (11): fi-ilk-m540 fi-hsw-4200u fi-bdw-gvtdvm fi-byt-squawks fi-ctg-p8600 fi-hsw-4770 fi-elk-e7500 fi-kbl-7560u fi-byt-n2820 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5538 -> IGTPW_4352

  CI-20190529: 20190529
  CI_DRM_8189: b851880963f76b6dd67d6abdcd2f365b268c23d4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4352: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/index.html
  IGT_5538: 47becbc9cd1fc7b1b78692f90fd3dcd5a9066965 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
