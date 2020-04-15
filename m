Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 15 Apr 2020 12:20:18 -0000
Message-ID: <158695321820.21014.16900998712702452980@emeril.freedesktop.org>
References: <20200415110625.24509-1-petri.latvala@intel.com>
In-Reply-To: <20200415110625.24509-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZ2VtX3dh?=
 =?utf-8?q?it/gem=5Fbusy=3A_Make_the_=22all=22_variant_a_normal_subtest?=
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

Series: gem_wait/gem_busy: Make the "all" variant a normal subtest
URL   : https://patchwork.freedesktop.org/series/75968/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8301 -> IGTPW_4465
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8301 and IGTPW_4465:

### New IGT tests (2) ###

  * igt@gem_wait@busy-all:
    - Statuses : 42 pass(s)
    - Exec time: [0.51, 0.55] s

  * igt@gem_wait@wait-all:
    - Statuses : 42 pass(s)
    - Exec time: [1.01, 1.07] s

  


Changes
-------

  No changes found


Participating hosts (50 -> 44)
------------------------------

  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5590 -> IGTPW_4465

  CI-20190529: 20190529
  CI_DRM_8301: 7d2bdd2df0d18945bb274de8bc7560e14779e346 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4465: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/index.html
  IGT_5590: c7b4a43942be32245b1c00b5b4a38401d8ca6e0d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_busy@busy-all
+igt@gem_wait@await-all
+igt@gem_wait@busy-all
+igt@gem_wait@hang-busy-all
+igt@gem_wait@hang-busy-write-all
+igt@gem_wait@hang-wait-all
+igt@gem_wait@hang-wait-write-all
+igt@gem_wait@wait-all
+igt@gem_wait@write-busy-all
+igt@gem_wait@write-wait-all

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
