Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jan 2020 09:19:09 -0000
Message-ID: <157985754964.15092.2463677090913244558@emeril.freedesktop.org>
References: <20200124081339.10518-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20200124081339.10518-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fpersistence=3A_Set_context_with_supported_engi?=
 =?utf-8?q?nes_=28rev3=29?=
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

Series: tests/i915/gem_ctx_persistence: Set context with supported engines (rev3)
URL   : https://patchwork.freedesktop.org/series/71810/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7806 -> IGTPW_3986
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3986/index.html

Known issues
------------

  Here are the changes found in IGTPW_3986 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_getparams_basic@basic-eu-total:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([CI#94] / [i915#402])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-tgl-y/igt@i915_getparams_basic@basic-eu-total.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3986/fi-tgl-y/igt@i915_getparams_basic@basic-eu-total.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-lmem:        [PASS][3] -> [INCOMPLETE][4] ([i915#671])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3986/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_active:
    - fi-icl-dsi:         [PASS][5] -> [DMESG-FAIL][6] ([i915#765])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-icl-dsi/igt@i915_selftest@live_active.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3986/fi-icl-dsi/igt@i915_selftest@live_active.html

  * igt@i915_selftest@live_requests:
    - fi-icl-guc:         [PASS][7] -> [INCOMPLETE][8] ([fdo#109644] / [fdo#110464] / [i915#140])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-icl-guc/igt@i915_selftest@live_requests.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3986/fi-icl-guc/igt@i915_selftest@live_requests.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][9] ([fdo#112271] / [i915#816]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3986/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_parallel@contexts:
    - fi-byt-j1900:       [FAIL][11] ([i915#694]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-byt-j1900/igt@gem_exec_parallel@contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3986/fi-byt-j1900/igt@gem_exec_parallel@contexts.html

  * igt@i915_selftest@live_blt:
    - fi-bsw-nick:        [DMESG-FAIL][13] ([i915#723]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-bsw-nick/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3986/fi-bsw-nick/igt@i915_selftest@live_blt.html
    - fi-hsw-4770r:       [DMESG-FAIL][15] ([i915#563]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3986/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-ivb-3770:        [DMESG-FAIL][17] ([i915#725]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3986/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [DMESG-FAIL][19] ([i915#770]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3986/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][21] ([fdo#111407]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3986/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-j1900:       [INCOMPLETE][23] ([i915#45]) -> [TIMEOUT][24] ([fdo#112271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/fi-byt-j1900/igt@gem_exec_parallel@fds.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3986/fi-byt-j1900/igt@gem_exec_parallel@fds.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#109644]: https://bugs.freedesktop.org/show_bug.cgi?id=109644
  [fdo#110464]: https://bugs.freedesktop.org/show_bug.cgi?id=110464
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#723]: https://gitlab.freedesktop.org/drm/intel/issues/723
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#765]: https://gitlab.freedesktop.org/drm/intel/issues/765
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816


Participating hosts (52 -> 44)
------------------------------

  Additional (1): fi-snb-2520m 
  Missing    (9): fi-ilk-m540 fi-hsw-4200u fi-bsw-n3050 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5382 -> IGTPW_3986

  CI-20190529: 20190529
  CI_DRM_7806: 0b551226df5e5b84044705d5fd76571da70f3163 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3986: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3986/index.html
  IGT_5382: 8dbe5ce61baa2d563d4dd7c56a018bb1e1077467 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3986/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
