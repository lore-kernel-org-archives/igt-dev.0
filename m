Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Jan 2020 15:51:14 -0000
Message-ID: <158031307404.5461.3089085800181360253@emeril.freedesktop.org>
References: <20200129131753.12460-1-petri.latvala@intel.com>
In-Reply-To: <20200129131753.12460-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_runner=3A_Support_dynamic_subt?=
 =?utf-8?q?ests_in_testlists?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] runner: Support dynamic subtests in testlists
URL   : https://patchwork.freedesktop.org/series/72719/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5404 -> IGTPW_4027
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4027 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4027, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4027:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - fi-bsw-kefka:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/fi-bsw-kefka/igt@runner@aborted.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/fi-bsw-nick/igt@runner@aborted.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/fi-bsw-n3050/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4027 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][4] -> [TIMEOUT][5] ([fdo#112271] / [i915#816])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [PASS][6] -> [FAIL][7] ([i915#178])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][8] -> [DMESG-FAIL][9] ([i915#553] / [i915#725])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [PASS][10] -> [DMESG-FAIL][11] ([i915#563])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [PASS][12] -> [DMESG-WARN][13] ([CI#94] / [i915#402]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [FAIL][14] ([i915#694]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][16] ([fdo#111096] / [i915#323]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@prime_self_import@basic-llseek-size:
    - fi-tgl-y:           [DMESG-WARN][18] ([CI#94] / [i915#402]) -> [PASS][19] +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/fi-tgl-y/igt@prime_self_import@basic-llseek-size.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/fi-tgl-y/igt@prime_self_import@basic-llseek-size.html

  
#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [TIMEOUT][20] ([fdo#112271]) -> [FAIL][21] ([i915#694])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816


Participating hosts (49 -> 47)
------------------------------

  Additional (3): fi-hsw-peppy fi-bxt-dsi fi-pnv-d510 
  Missing    (5): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5404 -> IGTPW_4027

  CI-20190529: 20190529
  CI_DRM_7837: 4a3438425d35afbf11f3d2c6092642d42c4cf941 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4027: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/index.html
  IGT_5404: 4147bab8e3dcaf11bd657b5fb4c109708e94e60c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
