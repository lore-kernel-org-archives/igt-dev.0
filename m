Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 08 May 2020 22:08:32 -0000
Message-ID: <158897571259.22721.5673679444442791794@emeril.freedesktop.org>
References: <20200508213447.1432-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200508213447.1432-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaWd0L2dl?=
 =?utf-8?q?m=5Fshrink=3A_touch_each_page_in_pwrite=5F/pread=5F_=28rev2=29?=
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: igt/gem_shrink: touch each page in pwrite_/pread_ (rev2)
URL   : https://patchwork.freedesktop.org/series/77085/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8455 -> IGTPW_4549
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4549 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4549, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4549/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4549:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@hangcheck:
    - fi-cml-s:           [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8455/fi-cml-s/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4549/fi-cml-s/igt@i915_selftest@live@hangcheck.html

  


Participating hosts (48 -> 42)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5642 -> IGTPW_4549

  CI-20190529: 20190529
  CI_DRM_8455: 0fa901c0a0e4f6e0ab2821f7b26c417539cecd08 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4549: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4549/index.html
  IGT_5642: d1ce4abb01c70f7be6e777b6d45442663c4b830e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4549/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
