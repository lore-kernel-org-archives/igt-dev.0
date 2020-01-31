Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 31 Jan 2020 18:00:33 -0000
Message-ID: <158049363372.13123.10208358137037280492@emeril.freedesktop.org>
References: <20200131170416.7663-1-antonio.argenziano@intel.com>
In-Reply-To: <20200131170416.7663-1-antonio.argenziano@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fbasic=3A_Skip_subtest_gtt_if_gtt_mapping_is_u?=
 =?utf-8?q?navailable_=28rev3=29?=
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_basic: Skip subtest gtt if gtt mapping is unavailable (rev3)
URL   : https://patchwork.freedesktop.org/series/72800/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7853 -> IGTPW_4063
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4063/index.html

Known issues
------------

  Here are the changes found in IGTPW_4063 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-icl-u3:          [PASS][1] -> [INCOMPLETE][2] ([i915#1090])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/fi-icl-u3/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4063/fi-icl-u3/igt@gem_exec_suspend@basic-s0.html
    - fi-cml-s:           [PASS][3] -> [FAIL][4] ([fdo#103375])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/fi-cml-s/igt@gem_exec_suspend@basic-s0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4063/fi-cml-s/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][5] -> [DMESG-FAIL][6] ([i915#770])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4063/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-guc:         [PASS][7] -> [INCOMPLETE][8] ([fdo#106070] / [i915#424])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4063/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [PASS][9] -> [FAIL][10] ([i915#217] / [i915#976])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4063/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [TIMEOUT][11] ([fdo#112271] / [i915#1084] / [i915#816]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4063/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [DMESG-FAIL][13] ([fdo#108569]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/fi-icl-y/igt@i915_selftest@live_execlists.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4063/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][15] ([fdo#111096] / [i915#323]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4063/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-cml-s:           [TIMEOUT][17] ([i915#1078]) -> [INCOMPLETE][18] ([i915#283])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/fi-cml-s/igt@gem_exec_suspend@basic-s3.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4063/fi-cml-s/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-guc:         [FAIL][19] ([i915#579]) -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4063/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][21] ([i915#563]) -> [DMESG-FAIL][22] ([i915#725])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4063/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#106070]: https://bugs.freedesktop.org/show_bug.cgi?id=106070
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1078]: https://gitlab.freedesktop.org/drm/intel/issues/1078
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#1090]: https://gitlab.freedesktop.org/drm/intel/issues/1090
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#283]: https://gitlab.freedesktop.org/drm/intel/issues/283
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (47 -> 45)
------------------------------

  Additional (5): fi-gdg-551 fi-cfl-8109u fi-skl-6600u fi-skl-6700k2 fi-snb-2600 
  Missing    (7): fi-kbl-soraka fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5409 -> IGTPW_4063

  CI-20190529: 20190529
  CI_DRM_7853: 1df04205c16923e525efe9c26d6e98612d38c9b3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4063: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4063/index.html
  IGT_5409: 93aefe6baa3fabf8c0cabe83e185f7b8f8d8753d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4063/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
