Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Jan 2020 10:16:02 -0000
Message-ID: <157856496209.4566.13667324663325627281@emeril.freedesktop.org>
References: <20200109070441.27511-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200109070441.27511-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHM6?=
 =?utf-8?q?_update_the_test_with_close=28=29_for_prime_fd?=
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests: update the test with close() for prime fd
URL   : https://patchwork.freedesktop.org/series/71805/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7705 -> IGTPW_3907
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3907:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_ctx_exec@basic:
    - {fi-ehl-1}:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-ehl-1/igt@gem_ctx_exec@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/fi-ehl-1/igt@gem_ctx_exec@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_3907 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_render_linear_blits@basic:
    - fi-icl-dsi:         [PASS][3] -> [DMESG-WARN][4] ([i915#109])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-icl-dsi/igt@gem_render_linear_blits@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/fi-icl-dsi/igt@gem_render_linear_blits@basic.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][5] -> [FAIL][6] ([fdo#111096] / [i915#323])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][7] ([i915#816]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-8700k:       [INCOMPLETE][9] ([i915#505]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
    - fi-kbl-x1275:       [INCOMPLETE][11] ([i915#879]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [SKIP][13] ([fdo#109271]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][15] ([i915#563]) -> [DMESG-FAIL][16] ([i915#725])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [DMESG-FAIL][17] ([i915#553] / [i915#725]) -> [DMESG-FAIL][18] ([i915#770])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7705/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#109]: https://gitlab.freedesktop.org/drm/intel/issues/109
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#505]: https://gitlab.freedesktop.org/drm/intel/issues/505
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879


Participating hosts (38 -> 45)
------------------------------

  Additional (12): fi-bdw-5557u fi-bsw-n3050 fi-hsw-peppy fi-snb-2520m fi-gdg-551 fi-ivb-3770 fi-bsw-kefka fi-skl-lmem fi-blb-e6850 fi-kbl-r fi-skl-6600u fi-snb-2600 
  Missing    (5): fi-skl-6770hq fi-byt-squawks fi-ctg-p8600 fi-pnv-d510 fi-kbl-7560u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5358 -> IGTPW_3907

  CI-20190529: 20190529
  CI_DRM_7705: b57ea8cadecd3444690439b4703d964afca476e1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3907: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/index.html
  IGT_5358: c6fc013f414b806175dc4143c58ab445e5235ea5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3907/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
