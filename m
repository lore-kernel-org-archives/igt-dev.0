Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Jan 2020 20:35:15 -0000
Message-ID: <157929331513.26757.2615820743391806@emeril.freedesktop.org>
References: <20200117181418.18755-1-jose.souza@intel.com>
In-Reply-To: <20200117181418.18755-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib=3A_Add_support_to_connecto?=
 =?utf-8?q?r_path_property?=
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

Series: series starting with [i-g-t,1/2] lib: Add support to connector path property
URL   : https://patchwork.freedesktop.org/series/72211/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7767 -> IGTPW_3936
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/index.html

Known issues
------------

  Here are the changes found in IGTPW_3936 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_param@basic:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/fi-tgl-y/igt@gem_ctx_param@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/fi-tgl-y/igt@gem_ctx_param@basic.html

  * igt@i915_selftest@live_blt:
    - fi-byt-j1900:       [PASS][3] -> [DMESG-FAIL][4] ([i915#725])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/fi-byt-j1900/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/fi-byt-j1900/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gt_heartbeat:
    - fi-bsw-n3050:       [PASS][5] -> [DMESG-FAIL][6] ([i915#541])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/fi-bsw-n3050/igt@i915_selftest@live_gt_heartbeat.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/fi-bsw-n3050/igt@i915_selftest@live_gt_heartbeat.html

  
#### Possible fixes ####

  * igt@i915_getparams_basic@basic-subslice-total:
    - fi-tgl-y:           [DMESG-WARN][7] ([i915#402]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6770hq:      [DMESG-WARN][9] ([i915#889]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6600u:       [DMESG-WARN][11] ([i915#889]) -> [PASS][12] +23 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][13] ([i915#725]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gt_lrc:
    - fi-skl-6600u:       [DMESG-FAIL][15] ([i915#889]) -> [PASS][16] +7 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html

  
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (44 -> 43)
------------------------------

  Additional (3): fi-blb-e6850 fi-ivb-3770 fi-snb-2600 
  Missing    (4): fi-byt-clapper fi-ilk-m540 fi-bsw-cyan fi-whl-u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5371 -> IGTPW_3936

  CI-20190529: 20190529
  CI_DRM_7767: dc447e46590410adce9a6fc6b19dbf02f1ba4ab4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3936: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/index.html
  IGT_5371: 1b2816124ec3dbd53b81725d39292f45d41d895b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_mst@all_enabled
+igt@kms_mst@change_master
+igt@kms_mst@change_resolution
+igt@kms_mst@fullmodeset_master

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
