Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Apr 2020 16:22:30 -0000
Message-ID: <158636295000.19348.11579466636647474067@emeril.freedesktop.org>
References: <20200408151213.30717-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200408151213.30717-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fsync=2Ec_=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengi?=
 =?utf-8?q?ne_to_utilize_all_available_=28rev6=29?=
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

Series: tests/i915/gem_sync.c :Added __for_each_physical_engine to utilize all available (rev6)
URL   : https://patchwork.freedesktop.org/series/75536/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8277 -> IGTPW_4433
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/index.html

Known issues
------------

  Here are the changes found in IGTPW_4433 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [FAIL][1] ([i915#1158]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  
  [i915#1158]: https://gitlab.freedesktop.org/drm/intel/issues/1158


Participating hosts (52 -> 47)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5581 -> IGTPW_4433

  CI-20190529: 20190529
  CI_DRM_8277: f7d56913e1668f3a269db391189a7888a4b22570 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4433: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/index.html
  IGT_5581: ab0620e555119ec55f12ba9ab9e6e9246d407648 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+++ 25 lines
--- 91 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
