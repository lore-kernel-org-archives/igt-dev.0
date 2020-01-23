Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 20:24:38 -0000
Message-ID: <157981107896.1146.1106672716487355655@emeril.freedesktop.org>
References: <20200123190029.19882-1-jose.souza@intel.com>
In-Reply-To: <20200123190029.19882-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpsr2=5Fsu=3A_Print_the_SU_blocks_mismatches?=
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

Series: tests/kms_psr2_su: Print the SU blocks mismatches
URL   : https://patchwork.freedesktop.org/series/72493/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7804 -> IGTPW_3982
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/index.html

Known issues
------------

  Here are the changes found in IGTPW_3982 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [PASS][1] -> [TIMEOUT][2] ([fdo#112271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-lmem:        [PASS][3] -> [DMESG-WARN][4] ([i915#889])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6600u:       [PASS][5] -> [DMESG-WARN][6] ([i915#889]) +23 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-bsw-n3050:       [PASS][7] -> [DMESG-FAIL][8] ([i915#723])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/fi-bsw-n3050/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/fi-bsw-n3050/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gt_lrc:
    - fi-skl-6600u:       [PASS][9] -> [DMESG-FAIL][10] ([i915#889]) +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - fi-tgl-y:           [PASS][11] -> [DMESG-WARN][12] ([CI#94] / [i915#402])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/fi-tgl-y/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/fi-tgl-y/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-icl-u2:          [PASS][13] -> [DMESG-WARN][14] ([i915#263])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][15] ([fdo#112271] / [i915#816]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_parallel@fds:
    - fi-byt-j1900:       [TIMEOUT][17] ([fdo#112271]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/fi-byt-j1900/igt@gem_exec_parallel@fds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/fi-byt-j1900/igt@gem_exec_parallel@fds.html

  * igt@i915_module_load@reload:
    - fi-icl-u2:          [DMESG-WARN][19] ([i915#289]) -> [PASS][20] +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/fi-icl-u2/igt@i915_module_load@reload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/fi-icl-u2/igt@i915_module_load@reload.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - fi-tgl-y:           [DMESG-WARN][21] ([CI#94] / [i915#402]) -> [PASS][22] +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-0.html

  
#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [TIMEOUT][23] ([fdo#112271]) -> [FAIL][24] ([i915#694])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][25] ([i915#725]) -> [DMESG-FAIL][26] ([i915#553] / [i915#725])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-icl-u2:          [DMESG-WARN][27] ([IGT#4] / [i915#263]) -> [FAIL][28] ([i915#323])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][29] ([fdo#111096] / [i915#323]) -> [FAIL][30] ([fdo#111407])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#263]: https://gitlab.freedesktop.org/drm/intel/issues/263
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#723]: https://gitlab.freedesktop.org/drm/intel/issues/723
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (49 -> 45)
------------------------------

  Additional (2): fi-hsw-peppy fi-snb-2600 
  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5382 -> IGTPW_3982

  CI-20190529: 20190529
  CI_DRM_7804: 74ed9d57007ab848a57ec6d785de4187b70acd9b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3982: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/index.html
  IGT_5382: 8dbe5ce61baa2d563d4dd7c56a018bb1e1077467 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
