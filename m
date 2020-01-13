Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 13 Jan 2020 09:46:32 -0000
Message-ID: <157890879235.16925.5995689755816146031@emeril.freedesktop.org>
References: <20200113091908.11983-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200113091908.11983-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgU2ltcGxp?=
 =?utf-8?q?fy_working_on_tiled_surfaces_over_GenX_=28rev3=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Simplify working on tiled surfaces over GenX (rev3)
URL   : https://patchwork.freedesktop.org/series/71740/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7728 -> IGTPW_3917
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3917 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3917, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3917:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - fi-bsw-n3050:       NOTRUN -> [FAIL][1] +37 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-bsw-n3050/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
    - fi-pnv-d510:        NOTRUN -> [FAIL][2] +37 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-pnv-d510/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - fi-byt-j1900:       NOTRUN -> [FAIL][3] +37 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-byt-j1900/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled:
    - fi-bsw-kefka:       NOTRUN -> [FAIL][4] +37 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-bsw-kefka/igt@gem_render_copy@y-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
    - fi-elk-e7500:       NOTRUN -> [FAIL][5] +37 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-elk-e7500/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - fi-blb-e6850:       NOTRUN -> [FAIL][6] +37 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-blb-e6850/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - fi-ilk-650:         NOTRUN -> [FAIL][7] +37 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-ilk-650/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled:
    - fi-bwr-2160:        NOTRUN -> [FAIL][8] +37 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-bwr-2160/igt@gem_render_copy@yf-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - fi-byt-n2820:       NOTRUN -> [FAIL][9] +37 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-byt-n2820/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - {fi-ehl-1}:         NOTRUN -> [SKIP][10] +19 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-ehl-1/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  
Known issues
------------

  Here are the changes found in IGTPW_3917 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_switch@rcs0:
    - fi-icl-guc:         [PASS][11] -> [INCOMPLETE][12] ([i915#140])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-icl-guc/igt@gem_ctx_switch@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-icl-guc/igt@gem_ctx_switch@rcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6700k2:      [PASS][13] -> [DMESG-WARN][14] ([i915#889])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
    - fi-skl-lmem:        [PASS][15] -> [INCOMPLETE][16] ([i915#671])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [PASS][17] -> [DMESG-FAIL][18] ([i915#553] / [i915#725])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-j1900:       [PASS][19] -> [DMESG-FAIL][20] ([i915#722])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gt_lrc:
    - fi-skl-6600u:       [PASS][21] -> [DMESG-FAIL][22] ([i915#889]) +7 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html

  * igt@i915_selftest@live_late_gt_pm:
    - fi-skl-6600u:       [PASS][23] -> [DMESG-WARN][24] ([i915#889]) +23 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-skl-6600u/igt@i915_selftest@live_late_gt_pm.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-skl-6600u/igt@i915_selftest@live_late_gt_pm.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - {fi-ehl-1}:         [INCOMPLETE][25] ([i915#937]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-ehl-1/igt@gem_exec_suspend@basic-s3.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-ehl-1/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][27] ([i915#563]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_reset:
    - fi-cfl-guc:         [DMESG-FAIL][29] ([i915#889]) -> [PASS][30] +7 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-cfl-guc/igt@i915_selftest@live_reset.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-cfl-guc/igt@i915_selftest@live_reset.html

  * igt@i915_selftest@live_workarounds:
    - fi-cfl-guc:         [DMESG-WARN][31] ([i915#889]) -> [PASS][32] +23 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-cfl-guc/igt@i915_selftest@live_workarounds.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-cfl-guc/igt@i915_selftest@live_workarounds.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][33] ([fdo#111096] / [i915#323]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][35] ([i915#725]) -> [DMESG-FAIL][36] ([i915#563])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-icl-u2:          [FAIL][37] ([i915#217]) -> [DMESG-WARN][38] ([IGT#4] / [i915#263])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#263]: https://gitlab.freedesktop.org/drm/intel/issues/263
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889
  [i915#937]: https://gitlab.freedesktop.org/drm/intel/issues/937


Participating hosts (52 -> 45)
------------------------------

  Missing    (7): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bsw-nick 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5364 -> IGTPW_3917

  CI-20190529: 20190529
  CI_DRM_7728: 8ece19823fb6b581f6577b8fa85a12227e38028c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3917: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/index.html
  IGT_5364: b7cb6ffdb65cbd233f5ddee2f2dabf97b34fa640 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
