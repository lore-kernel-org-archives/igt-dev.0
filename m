Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Apr 2020 07:27:56 -0000
Message-ID: <158572607650.25625.13228528585096779768@emeril.freedesktop.org>
References: <20200401065423.29345-1-mika.kahola@intel.com>
In-Reply-To: <20200401065423.29345-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fconcurrent=3A_Calculate_maximum_number_of_planes_to_meet_?=
 =?utf-8?q?bandwidth_requirement_=28rev3=29?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_concurrent: Calculate maximum number of planes to meet bandwidth requirement (rev3)
URL   : https://patchwork.freedesktop.org/series/75323/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8230 -> IGTPW_4388
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/index.html

Known issues
------------

  Here are the changes found in IGTPW_4388 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-cml-u2:          [PASS][1] -> [DMESG-WARN][2] ([IGT#4])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4


Participating hosts (40 -> 40)
------------------------------

  Additional (7): fi-byt-j1900 fi-skl-guc fi-ilk-650 fi-kbl-7500u fi-hsw-4770 fi-bsw-kefka fi-skl-6700k2 
  Missing    (7): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus fi-kbl-r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5550 -> IGTPW_4388

  CI-20190529: 20190529
  CI_DRM_8230: fa9f8453ffb88a4fc4e36d68b84a7ff9bf90f769 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4388: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/index.html
  IGT_5550: 98927dfde17aecaecfe67bb9853ceca326ca2b23 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
