Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 21 Dec 2019 00:38:10 -0000
Message-ID: <157688869065.32690.15071127900102785481@emeril.freedesktop.org>
References: <20191219235047.15224-1-robert.m.fosha@intel.com>
In-Reply-To: <20191219235047.15224-1-robert.m.fosha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fhuc=5Fcopy=3A_Enable_a_HuC_copy_test_=28rev2=29?=
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
To: "Robert M. Fosha" <robert.m.fosha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_huc_copy: Enable a HuC copy test (rev2)
URL   : https://patchwork.freedesktop.org/series/71194/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7616 -> IGTPW_3882
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3882 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3882, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3882/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3882:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_gt_heartbeat:
    - fi-bsw-n3050:       NOTRUN -> [DMESG-FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3882/fi-bsw-n3050/igt@i915_selftest@live_gt_heartbeat.html

  
Known issues
------------

  Here are the changes found in IGTPW_3882 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][2] -> [DMESG-FAIL][3] ([i915#770])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7616/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3882/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [PASS][4] -> [DMESG-FAIL][5] ([i915#553] / [i915#725])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7616/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3882/fi-hsw-4770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770r:       [PASS][6] -> [DMESG-FAIL][7] ([i915#553] / [i915#725])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7616/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3882/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-n2820:       [PASS][8] -> [INCOMPLETE][9] ([i915#45])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7616/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3882/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][10] -> [FAIL][11] ([fdo#111407])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7616/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3882/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][12] ([i915#816]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7616/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3882/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-kbl-x1275:       [DMESG-WARN][14] ([i915#62] / [i915#92]) -> [DMESG-WARN][15] ([i915#62] / [i915#92] / [i915#95]) +5 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7616/fi-kbl-x1275/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3882/fi-kbl-x1275/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-kbl-x1275:       [DMESG-WARN][16] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][17] ([i915#62] / [i915#92]) +5 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7616/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3882/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (46 -> 44)
------------------------------

  Additional (4): fi-hsw-peppy fi-bsw-nick fi-elk-e7500 fi-bsw-n3050 
  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5351 -> IGTPW_3882

  CI-20190529: 20190529
  CI_DRM_7616: 81105b549355270c1d15073dc7f7b137cdc3d5c4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3882: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3882/index.html
  IGT_5351: e7fdcef72d1d6b3bb9f3003bbc37571959e6e8bb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_huc_copy@huc-copy

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3882/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
