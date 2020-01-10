Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Jan 2020 12:40:59 -0000
Message-ID: <157866005988.30835.7931293127790741914@emeril.freedesktop.org>
References: <20200109132941.21401-1-petri.latvala@intel.com>
In-Reply-To: <20200109132941.21401-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcHJpbWVf?=
 =?utf-8?q?udl=3A_Remove_incorrect_copypasted_comment=2C_add_description?=
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

Series: prime_udl: Remove incorrect copypasted comment, add description
URL   : https://patchwork.freedesktop.org/series/71821/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7706 -> IGTPW_3909
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3909/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3909:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_suspend@basic-s0:
    - {fi-ehl-1}:         NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3909/fi-ehl-1/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - {fi-ehl-1}:         NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3909/fi-ehl-1/igt@gem_exec_suspend@basic-s4-devices.html

  
Known issues
------------

  Here are the changes found in IGTPW_3909 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6700k2:      [PASS][3] -> [DMESG-WARN][4] ([i915#889])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7706/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3909/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_execlists:
    - fi-kbl-r:           [PASS][5] -> [DMESG-FAIL][6] ([i915#841])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7706/fi-kbl-r/igt@i915_selftest@live_execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3909/fi-kbl-r/igt@i915_selftest@live_execlists.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-wait-default:
    - {fi-ehl-1}:         [INCOMPLETE][7] ([i915#949]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7706/fi-ehl-1/igt@gem_exec_fence@basic-wait-default.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3909/fi-ehl-1/igt@gem_exec_fence@basic-wait-default.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-bxt-dsi:         [INCOMPLETE][9] ([fdo#103927]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7706/fi-bxt-dsi/igt@i915_module_load@reload-with-fault-injection.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3909/fi-bxt-dsi/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][11] ([i915#553]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7706/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3909/fi-hsw-4770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770r:       [DMESG-FAIL][13] ([i915#725]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7706/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3909/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@prime_vgem@basic-write:
    - fi-icl-dsi:         [DMESG-WARN][15] ([i915#109]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7706/fi-icl-dsi/igt@prime_vgem@basic-write.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3909/fi-icl-dsi/igt@prime_vgem@basic-write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [i915#109]: https://gitlab.freedesktop.org/drm/intel/issues/109
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#841]: https://gitlab.freedesktop.org/drm/intel/issues/841
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889
  [i915#949]: https://gitlab.freedesktop.org/drm/intel/issues/949


Participating hosts (44 -> 45)
------------------------------

  Additional (8): fi-kbl-soraka fi-skl-6770hq fi-kbl-7500u fi-ivb-3770 fi-skl-lmem fi-bsw-nick fi-skl-6600u fi-snb-2600 
  Missing    (7): fi-cml-s fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-tgl-y fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5358 -> IGTPW_3909

  CI-20190529: 20190529
  CI_DRM_7706: 3d36ffaa59259e46de9dde125d18d228d764609f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3909: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3909/index.html
  IGT_5358: c6fc013f414b806175dc4143c58ab445e5235ea5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3909/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
