Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 07 Apr 2020 14:29:41 -0000
Message-ID: <158626978131.26325.593429526037697376@emeril.freedesktop.org>
References: <20200407134716.8872-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200407134716.8872-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fsync=2Ec_=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengi?=
 =?utf-8?q?ne_to_utilize_all_available_=28rev5=29?=
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

Series: tests/i915/gem_sync.c :Added __for_each_physical_engine to utilize all available (rev5)
URL   : https://patchwork.freedesktop.org/series/75536/
State : success

== Summary ==

CI Bug Log - changes from IGT_5574 -> IGTPW_4426
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/index.html

Known issues
------------

  Here are the changes found in IGTPW_4426 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-cml-u2:          [DMESG-WARN][1] ([IGT#4]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4


Participating hosts (53 -> 47)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5574 -> IGTPW_4426

  CI-20190529: 20190529
  CI_DRM_8264: e0104585f880a64d4a9b40803cf4fb51ab499f7c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4426: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/index.html
  IGT_5574: 15e8ffecfd55d3d632491b73ed981e4467145a4b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+++ 19 lines
--- 91 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4426/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
