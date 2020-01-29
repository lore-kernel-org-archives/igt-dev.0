Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Jan 2020 20:27:45 -0000
Message-ID: <158032966581.5462.18157579224996508906@emeril.freedesktop.org>
References: <20200129181002.9405-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20200129181002.9405-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fpersistence=3A_Set_context_with_supported_engi?=
 =?utf-8?q?nes_=28rev7=29?=
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
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ctx_persistence: Set context with supported engines (rev7)
URL   : https://patchwork.freedesktop.org/series/71810/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7838 -> IGTPW_4032
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4032:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_module_load@reload-with-fault-injection:
    - {fi-ehl-1}:         [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-ehl-1/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/fi-ehl-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@runner@aborted:
    - {fi-ehl-1}:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/fi-ehl-1/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4032 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [PASS][4] -> [FAIL][5] ([CI#94])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [PASS][6] -> [FAIL][7] ([i915#178])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-u2:          [PASS][8] -> [INCOMPLETE][9] ([i915#140])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-icl-u2/igt@i915_selftest@live_execlists.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/fi-icl-u2/igt@i915_selftest@live_execlists.html
    - fi-icl-dsi:         [PASS][10] -> [INCOMPLETE][11] ([i915#140])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-icl-dsi/igt@i915_selftest@live_execlists.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/fi-icl-dsi/igt@i915_selftest@live_execlists.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [PASS][12] -> [DMESG-WARN][13] ([CI#94] / [i915#402]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][14] ([i915#553] / [i915#725]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/fi-hsw-4770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770r:       [DMESG-FAIL][16] ([i915#725]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-8700k:       [INCOMPLETE][18] ([i915#424]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gtt:
    - fi-bdw-5557u:       [TIMEOUT][20] ([fdo#112271]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-bdw-5557u/igt@i915_selftest@live_gtt.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/fi-bdw-5557u/igt@i915_selftest@live_gtt.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - fi-icl-dsi:         [DMESG-WARN][22] ([i915#109]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-icl-dsi/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/fi-icl-dsi/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@prime_self_import@basic-llseek-size:
    - fi-tgl-y:           [DMESG-WARN][24] ([CI#94] / [i915#402]) -> [PASS][25] +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-tgl-y/igt@prime_self_import@basic-llseek-size.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/fi-tgl-y/igt@prime_self_import@basic-llseek-size.html

  
#### Warnings ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][26] ([fdo#111096] / [i915#323]) -> [FAIL][27] ([fdo#111407])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#109]: https://gitlab.freedesktop.org/drm/intel/issues/109
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#998]: https://gitlab.freedesktop.org/drm/intel/issues/998


Participating hosts (50 -> 48)
------------------------------

  Additional (2): fi-byt-n2820 fi-bwr-2160 
  Missing    (4): fi-ilk-m540 fi-byt-clapper fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5404 -> IGTPW_4032

  CI-20190529: 20190529
  CI_DRM_7838: d3d96beea538c8de906a1c4d7e6793a47d17a471 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4032: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/index.html
  IGT_5404: 4147bab8e3dcaf11bd657b5fb4c109708e94e60c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
