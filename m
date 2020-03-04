Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 04 Mar 2020 16:15:30 -0000
Message-ID: <158333853020.426.18157269566590035931@emeril.freedesktop.org>
References: <20200304132457.13258-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200304132457.13258-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZ2VtX3dz?=
 =?utf-8?q?im=3A_Fix_calibration_for_default_and_virtual_engine?=
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: gem_wsim: Fix calibration for default and virtual engine
URL   : https://patchwork.freedesktop.org/series/74267/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8065 -> IGTPW_4257
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4257:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@active:
    - {fi-tgl-dsi}:       [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/fi-tgl-dsi/igt@i915_selftest@live@active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/fi-tgl-dsi/igt@i915_selftest@live@active.html

  
Known issues
------------

  Here are the changes found in IGTPW_4257 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@prime_self_import@basic-llseek-size:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([CI#94] / [i915#402]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/fi-tgl-y/igt@prime_self_import@basic-llseek-size.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/fi-tgl-y/igt@prime_self_import@basic-llseek-size.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - fi-tgl-y:           [DMESG-WARN][5] ([CI#94] / [i915#402]) -> [PASS][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/fi-tgl-y/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/fi-tgl-y/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][7] ([fdo#111096] / [i915#323]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (45 -> 46)
------------------------------

  Additional (8): fi-byt-j1900 fi-glk-dsi fi-gdg-551 fi-ivb-3770 fi-elk-e7500 fi-skl-lmem fi-kbl-7560u fi-bsw-nick 
  Missing    (7): fi-icl-1065g7 fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5491 -> IGTPW_4257

  CI-20190529: 20190529
  CI_DRM_8065: e50ed1b1ef982f7648ca558f1cfd16ad3190e094 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4257: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/index.html
  IGT_5491: d52794b426ae16630cc1e0354ae435ec98f6174b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4257/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
