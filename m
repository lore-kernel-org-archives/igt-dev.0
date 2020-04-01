Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Apr 2020 02:43:04 -0000
Message-ID: <158570898426.25627.2582432312786699469@emeril.freedesktop.org>
References: <20200331162320.968537-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200331162320.968537-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915/gem=5Fexec=5Freloc=3A_Dyn?=
 =?utf-8?q?amic_active_engine_tests_=28rev2=29?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] i915/gem_exec_reloc: Dynamic active engine tests (rev2)
URL   : https://patchwork.freedesktop.org/series/75332/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8230 -> IGTPW_4385
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/index.html


Changes
-------

  No changes found


Participating hosts (40 -> 41)
------------------------------

  Additional (8): fi-byt-j1900 fi-skl-guc fi-ilk-650 fi-kbl-7500u fi-hsw-4770 fi-bsw-kefka fi-bsw-nick fi-skl-6700k2 
  Missing    (7): fi-hsw-4200u fi-bsw-n3050 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5550 -> IGTPW_4385

  CI-20190529: 20190529
  CI_DRM_8230: fa9f8453ffb88a4fc4e36d68b84a7ff9bf90f769 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4385: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/index.html
  IGT_5550: 98927dfde17aecaecfe67bb9853ceca326ca2b23 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_reloc@basic-parallel
+igt@gem_exec_reloc@basic-spin
-igt@gem_exec_reloc@basic-active-blt
-igt@gem_exec_reloc@basic-active-bsd
-igt@gem_exec_reloc@basic-active-bsd1
-igt@gem_exec_reloc@basic-active-bsd2
-igt@gem_exec_reloc@basic-active-default
-igt@gem_exec_reloc@basic-active-render
-igt@gem_exec_reloc@basic-active-vebox
-igt@gem_exec_reloc@basic-spin-blt
-igt@gem_exec_reloc@basic-spin-bsd
-igt@gem_exec_reloc@basic-spin-bsd1
-igt@gem_exec_reloc@basic-spin-bsd2
-igt@gem_exec_reloc@basic-spin-default
-igt@gem_exec_reloc@basic-spin-render
-igt@gem_exec_reloc@basic-spin-vebox

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
