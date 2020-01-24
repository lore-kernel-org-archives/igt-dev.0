Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jan 2020 15:51:50 -0000
Message-ID: <157988111048.15090.13070658147088391792@emeril.freedesktop.org>
References: <20200124142435.14506-1-swati2.sharma@intel.com>
In-Reply-To: <20200124142435.14506-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIHRl?=
 =?utf-8?q?sts_for_HDR_metadata_interfaces_and_bpc_switch_=28rev2=29?=
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

Series: Add tests for HDR metadata interfaces and bpc switch (rev2)
URL   : https://patchwork.freedesktop.org/series/71524/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5383 -> IGTPW_3991
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3991 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3991, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3991/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3991:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_execlists:
    - fi-cfl-8700k:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/fi-cfl-8700k/igt@i915_selftest@live_execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3991/fi-cfl-8700k/igt@i915_selftest@live_execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_3991 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_param@basic:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([CI#94] / [i915#402]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/fi-tgl-y/igt@gem_ctx_param@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3991/fi-tgl-y/igt@gem_ctx_param@basic.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6700k2:      [PASS][5] -> [DMESG-WARN][6] ([i915#889])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3991/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6600u:       [PASS][7] -> [DMESG-WARN][8] ([i915#889]) +23 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3991/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_gt_lrc:
    - fi-skl-6600u:       [PASS][9] -> [DMESG-FAIL][10] ([i915#889]) +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3991/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [INCOMPLETE][11] ([i915#45]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3991/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [FAIL][13] ([CI#94]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3991/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@kms_addfb_basic@invalid-get-prop:
    - fi-tgl-y:           [DMESG-WARN][15] ([CI#94] / [i915#402]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/fi-tgl-y/igt@kms_addfb_basic@invalid-get-prop.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3991/fi-tgl-y/igt@kms_addfb_basic@invalid-get-prop.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][17] ([i915#725]) -> [DMESG-FAIL][18] ([i915#563])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3991/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-ivb-3770:        [DMESG-FAIL][19] ([i915#770]) -> [DMESG-FAIL][20] ([i915#725])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3991/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][21] ([fdo#111407]) -> [FAIL][22] ([fdo#111096] / [i915#323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3991/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (49 -> 45)
------------------------------

  Additional (1): fi-byt-j1900 
  Missing    (5): fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5383 -> IGTPW_3991

  CI-20190529: 20190529
  CI_DRM_7809: 861f608ce6e3c1a1ad320a5d18055601cff36e45 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3991: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3991/index.html
  IGT_5383: 81948d9e088db962c1fd413c93920cbc826f3d25 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_hdr@bpc-switch
+igt@kms_hdr@bpc-switch-dpms
+igt@kms_hdr@bpc-switch-suspend
+igt@kms_hdr@static-swap
+igt@kms_hdr@static-toggle
+igt@kms_hdr@static-toggle-dpms
+igt@kms_hdr@static-toggle-suspend

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3991/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
