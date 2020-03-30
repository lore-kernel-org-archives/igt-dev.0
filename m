Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 30 Mar 2020 14:44:26 -0000
Message-ID: <158557946676.13825.4783119806506851615@emeril.freedesktop.org>
References: <20200330135039.19696-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200330135039.19696-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fnop=3A-Fixed_Crash_issue_seen_on_few_platform?=
 =?utf-8?q?_=28rev4=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_nop:-Fixed Crash issue seen on few platform (rev4)
URL   : https://patchwork.freedesktop.org/series/75145/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8213 -> IGTPW_4375
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4375 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4375, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4375/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4375:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload:
    - fi-bsw-kefka:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/fi-bsw-kefka/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4375/fi-bsw-kefka/igt@i915_module_load@reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_4375 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bxt-dsi:         [INCOMPLETE][3] ([i915#656]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4375/fi-bxt-dsi/igt@i915_selftest@live@execlists.html

  
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656


Participating hosts (47 -> 45)
------------------------------

  Additional (6): fi-hsw-4770r fi-bsw-n3050 fi-byt-j1900 fi-glk-dsi fi-kbl-7560u fi-tgl-y 
  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-skl-6770hq fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5544 -> IGTPW_4375

  CI-20190529: 20190529
  CI_DRM_8213: 3cebf14c87d0d4508d4cc9c49db14061af752c37 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4375: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4375/index.html
  IGT_5544: 477c562fc9932939083d732b77dd7b083c6bc0a1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4375/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
