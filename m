Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 11 Apr 2020 03:42:22 -0000
Message-ID: <158657654283.322.10239023348270449085@emeril.freedesktop.org>
References: <20200408201925.31566-1-jose.souza@intel.com>
In-Reply-To: <20200408201925.31566-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Ffbcon=5Ffbt=3A_Mak?=
 =?utf-8?q?e_FBC_wait=5Funtil=5Fupdate=28=29_more_reliable_=28rev3=29?=
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_fbcon_fbt: Make FBC wait_until_update() more reliable (rev3)
URL   : https://patchwork.freedesktop.org/series/75701/
State : success

== Summary ==

CI Bug Log - changes from IGT_5588 -> IGTPW_4445
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/index.html

Known issues
------------

  Here are the changes found in IGTPW_4445 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bsw-kefka:       [PASS][1] -> [INCOMPLETE][2] ([i915#1382])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-bsw-kefka/igt@i915_selftest@live@late_gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/fi-bsw-kefka/igt@i915_selftest@live@late_gt_pm.html

  
#### Possible fixes ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-cml-u2:          [DMESG-WARN][3] ([IGT#4]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [i915#1382]: https://gitlab.freedesktop.org/drm/intel/issues/1382


Participating hosts (51 -> 45)
------------------------------

  Additional (1): fi-skl-lmem 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5588 -> IGTPW_4445

  CI-20190529: 20190529
  CI_DRM_8291: ef6b9e8bc3134d7261f080ceb5158b16447a4793 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4445: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/index.html
  IGT_5588: 83182c9b2dee30f9e49b980606802de2bbf8d218 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4445/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
