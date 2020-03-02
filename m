Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 02 Mar 2020 18:52:11 -0000
Message-ID: <158317513185.30646.18348784075163793219@emeril.freedesktop.org>
References: <20200302173314.378918-1-emil.l.velikov@gmail.com>
In-Reply-To: <20200302173314.378918-1-emil.l.velikov@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdHMvY29y?=
 =?utf-8?q?e=5Fsetmaster=3A_new_test_for_drop/set_master_semantics_=28rev3?=
 =?utf-8?q?=29?=
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
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: ts/core_setmaster: new test for drop/set master semantics (rev3)
URL   : https://patchwork.freedesktop.org/series/73650/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8046 -> IGTPW_4245
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/index.html

Known issues
------------

  Here are the changes found in IGTPW_4245 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-skl-6600u:       [PASS][1] -> [INCOMPLETE][2] ([i915#146] / [i915#69])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [PASS][3] -> [DMESG-WARN][4] ([i915#44])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  * igt@prime_vgem@basic-gtt:
    - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([CI#94] / [i915#402]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/fi-tgl-y/igt@prime_vgem@basic-gtt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/fi-tgl-y/igt@prime_vgem@basic-gtt.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [FAIL][7] ([CI#94]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - fi-tgl-y:           [DMESG-WARN][9] ([CI#94] / [i915#402]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/fi-tgl-y/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/fi-tgl-y/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][11] ([fdo#111096] / [i915#323]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-kbl-guc:         [FAIL][13] ([i915#704]) -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#69]: https://gitlab.freedesktop.org/drm/intel/issues/69
  [i915#704]: https://gitlab.freedesktop.org/drm/intel/issues/704


Participating hosts (43 -> 43)
------------------------------

  Additional (6): fi-bdw-5557u fi-bwr-2160 fi-snb-2520m fi-gdg-551 fi-bsw-kefka fi-snb-2600 
  Missing    (6): fi-ilk-m540 fi-byt-squawks fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5483 -> IGTPW_4245

  CI-20190529: 20190529
  CI_DRM_8046: be13ba469987146d8e75f7c07103c0a087a3b520 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4245: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/index.html
  IGT_5483: 1707153df224ffb6333c6c660a792b7f334eb3d3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@core_setmaster@master-drop-set-root
+igt@core_setmaster@master-drop-set-shared-fd
+igt@core_setmaster@master-drop-set-user

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
