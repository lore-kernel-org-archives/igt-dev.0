Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Jan 2020 10:45:12 -0000
Message-ID: <157856671278.4564.15851937728015250061@emeril.freedesktop.org>
References: <20200109085023.25551-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20200109085023.25551-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fpersistence=3A_Set_context_with_supported_engi?=
 =?utf-8?q?nes?=
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

Series: tests/i915/gem_ctx_persistence: Set context with supported engines
URL   : https://patchwork.freedesktop.org/series/71810/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7705 -> IGTPW_3908
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3908:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_suspend@basic-s4-devices:
    - {fi-ehl-1}:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/fi-ehl-1/igt@gem_exec_suspend@basic-s4-devices.html

  
Known issues
------------

  Here are the changes found in IGTPW_3908 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6700k2:      [PASS][2] -> [DMESG-WARN][3] ([i915#889])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-guc:         [PASS][4] -> [INCOMPLETE][5] ([fdo#106070] / [i915#424])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][6] -> [FAIL][7] ([fdo#111407])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][8] ([i915#816]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_fence@nb-await-default:
    - {fi-ehl-1}:         [INCOMPLETE][10] -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-ehl-1/igt@gem_exec_fence@nb-await-default.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/fi-ehl-1/igt@gem_exec_fence@nb-await-default.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-8700k:       [INCOMPLETE][12] ([i915#505]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
    - fi-kbl-x1275:       [INCOMPLETE][14] ([i915#879]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [SKIP][16] ([fdo#109271]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][18] ([i915#553] / [i915#725]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-skl-6770hq:      [INCOMPLETE][20] ([i915#435]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#106070]: https://bugs.freedesktop.org/show_bug.cgi?id=106070
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#505]: https://gitlab.freedesktop.org/drm/intel/issues/505
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (38 -> 45)
------------------------------

  Additional (12): fi-bdw-5557u fi-bsw-n3050 fi-hsw-peppy fi-snb-2520m fi-gdg-551 fi-ivb-3770 fi-bsw-kefka fi-skl-lmem fi-blb-e6850 fi-kbl-r fi-skl-6600u fi-snb-2600 
  Missing    (5): fi-hsw-4770r fi-byt-squawks fi-ctg-p8600 fi-kbl-7560u fi-tgl-y 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5358 -> IGTPW_3908

  CI-20190529: 20190529
  CI_DRM_7705: b57ea8cadecd3444690439b4703d964afca476e1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3908: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/index.html
  IGT_5358: c6fc013f414b806175dc4143c58ab445e5235ea5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3908/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
